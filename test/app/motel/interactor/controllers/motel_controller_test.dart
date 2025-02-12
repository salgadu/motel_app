import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:motel_list/app/core/errors/failures.dart';
import 'package:motel_list/app/motel/data/adapter/motel_adapter.dart';
import 'package:motel_list/app/motel/interactor/controllers/motel_controller.dart';
import 'package:motel_list/app/motel/interactor/repositories/i_motel_repository.dart';
import 'package:motel_list/app/motel/interactor/states/motel_state.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../mock_api.dart';

class MockMotelRepository extends Mock implements IMotelRepository {}

void main() {
  late MockMotelRepository mockRepository;
  late MotelController controller;

  setUp(() {
    mockRepository = MockMotelRepository();
    controller = MotelController(mockRepository);
    registerFallbackValue(0);
  });

  group('MotelController', () {
    test('Deve retornar MotelInitial quando instanciado', () {
      expect(controller.state, isA<MotelInitial>());
    });

    test('Deve retornar MotelLoading quando fetchMotelData for chamado',
        () async {
      when(() => mockRepository.getMotelList(any()))
          .thenAnswer((_) async => Success(MotelAdapter.fromJson(apiResult)));

      controller.fetchMotelData();
      expect(controller.state, isA<MotelLoading>());
    });

    test(
        'Deve retornar MotelSuccess quando fetchMotelData for chamado com sucesso',
        () async {
      when(() => mockRepository.getMotelList(any()))
          .thenAnswer((_) async => Success(MotelAdapter.fromJson(apiResult)));

      await controller.fetchMotelData();
      expect(controller.state, isA<MotelSuccess>());
    });

    test('Deve retornar MotelError quando fetchMotelData for chamado com erro',
        () async {
      when(() => mockRepository.getMotelList(any())).thenAnswer(
        (_) async => Failure(DataSourceError(message: "Erro ao buscar dados.")),
      );

      await controller.fetchMotelData();
      expect(controller.state, isA<MotelError>());
    });
  });
}
