import 'package:motel_list/app/core/client/i_client_http.dart';
import 'package:motel_list/app/core/errors/failures.dart';
import 'package:motel_list/app/core/types/types.dart';
import 'package:motel_list/app/motel/data/adapter/motel_adapter.dart';
import 'package:motel_list/app/motel/interactor/entities/motel.dart';
import 'package:motel_list/app/motel/interactor/repositories/i_motel_repository.dart';
import 'package:result_dart/result_dart.dart';

class MotelRepositoryImpl implements IMotelRepository {
  final IClientHttp client;

  MotelRepositoryImpl(this.client);

  @override
  Future<Output<MotelData>> getMotelList(int? index) async {
    try {
      final response = await client.get('/b/1IXK',
          queryParameters: index != null ? {'page': index} : null);

      if (response.statusCode == 200 && response.data != null) {
        final motelData = MotelAdapter.fromJson(response.data["data"]);
        return Success(motelData);
      } else {
        return Failure(DataSourceError(message: "Erro ao buscar dados."));
      }
    } on DataSourceError catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(DataSourceError(
          message: "Erro interno, tente novamente mais tarde."));
    }
  }
}
