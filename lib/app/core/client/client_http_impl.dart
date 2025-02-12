import 'dart:convert';
import 'dart:io';
import 'package:motel_list/app/core/client/i_client_http.dart';
import 'package:motel_list/app/core/errors/failures.dart';

const int configTimeout = 10;
const String defaultBaseUrl = "https://www.jsonkeeper.com";

class HttpFactory {
  static HttpClient http() {
    final client = HttpClient();
    client.connectionTimeout = const Duration(seconds: configTimeout);
    return client;
  }
}

class ClientHttpImpl implements IClientHttp {
  final HttpClient _httpClient;
  final String baseUrl;

  ClientHttpImpl(this._httpClient, {required this.baseUrl});

  @override
  Future<Response<dynamic>> get(String urlOrPath,
      {Map<String, dynamic>? queryParameters,
      Map<String, String>? headers}) async {
    try {
      final uri = _buildUri(urlOrPath, queryParameters);

      final request = await _httpClient.getUrl(uri);

      headers?.forEach((key, value) {
        request.headers.set(key, value);
      });

      final response = await request.close();
      final responseBody = await response.transform(utf8.decoder).join();
      final statusCode = response.statusCode;
      final responseHeaders = <String, String>{};
      response.headers.forEach((key, values) {
        responseHeaders[key] = values.join(',');
      });

      return Response(
        statusCode: statusCode,
        headers: responseHeaders,
        data: jsonDecode(responseBody),
      );
    } on SocketException catch (e) {
      throw BaseException("Erro de conexão: ${e.message}");
    } catch (e) {
      throw BaseException("Erro inesperado: $e");
    }
  }

  Uri _buildUri(String urlOrPath, Map<String, dynamic>? queryParameters) {
    final Uri uri = Uri.parse(urlOrPath);

    if (uri.hasScheme) {
      return uri.replace(queryParameters: queryParameters);
    } else {
      return Uri.parse(baseUrl).replace(
        path: '${Uri.parse(baseUrl).path}$urlOrPath',
        queryParameters: queryParameters,
      );
    }
  }
}
