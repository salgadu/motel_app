import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:motel_list/app/core/client/i_client_http.dart';
import 'package:motel_list/app/core/errors/failures.dart';
import 'package:motel_list/app/motel/data/repositories/motel_repository_impl.dart';
import 'package:motel_list/app/motel/interactor/entities/motel.dart';
import 'package:motel_list/app/motel/interactor/repositories/i_motel_repository.dart';

import '../../../../mock_api.dart';

class MockClientHttp extends Mock implements IClientHttp {}

class MockMotelRepository extends Mock implements IMotelRepository {}

void main() {
  late MotelRepositoryImpl repository;
  late MockClientHttp mockClientHttp;

  setUp(() {
    mockClientHttp = MockClientHttp();
    repository = MotelRepositoryImpl(mockClientHttp);
  });

  group('MotelRepositoryImpl - getMotelList', () {
    test(
        'Deve retornar um Success(MotelData) quando a requisição for bem-sucedida',
        () async {
      when(() =>
          mockClientHttp.get('/b/1IXK',
              queryParameters: any(named: 'queryParameters'))).thenAnswer(
          (_) async => Response(data: apiResult, statusCode: 200, headers: {}));

      final result = await repository.getMotelList(1);

      expect(result.isSuccess(), true);
      expect(result.getOrNull(), isA<MotelData>());
    });

    test(
      'Deve retornar um Success(MotelData) onde o primeiro motel o nome fantasia deve ser  Motel Le Nid',
      () async {
        when(() => mockClientHttp.get('/b/1IXK',
                queryParameters: any(named: 'queryParameters')))
            .thenAnswer((_) async =>
                Response(data: apiResult, statusCode: 200, headers: {}));

        final result = await repository.getMotelList(1);
        MotelData? motelData;
        result.fold((success) {
          motelData = success;
        }, (error) => motelData = null);

        expect(result.isSuccess(), true);
        expect(motelData!.moteis.first.fantasia, "Motel Le Nid");
      },
    );

    test('Deve retornar um Failure(DataSourceError) quando a API retorna erro',
        () async {
      when(() => mockClientHttp.get('/b/1IXK',
              queryParameters: any(named: 'queryParameters')))
          .thenThrow(DataSourceError(message: "Erro ao buscar dados."));

      final result = await repository.getMotelList(1);

      expect(result.isError(), true);
      expect(result.exceptionOrNull(), isA<DataSourceError>());
    });

    test('Deve retornar um Failure(DataSourceError) em erro genérico',
        () async {
      when(() => mockClientHttp.get('/b/1IXK',
              queryParameters: any(named: 'queryParameters')))
          .thenThrow(Exception("Erro desconhecido"));

      final result = await repository.getMotelList(1);

      expect(result.isError(), true);
      expect(result.exceptionOrNull(), isA<DataSourceError>());
    });
  });
}
