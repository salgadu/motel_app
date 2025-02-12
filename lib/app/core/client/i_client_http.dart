abstract class IClientHttp {
  Future<Response<dynamic>> get(String url,
      {Map<String, dynamic>? queryParameters, Map<String, String>? headers});
}

class Response<T> {
  final int statusCode;
  final Map<String, dynamic> headers;
  final T data;

  Response({
    required this.statusCode,
    required this.headers,
    required this.data,
  });
}
