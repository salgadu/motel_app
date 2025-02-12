import 'package:motel_list/app/motel/interactor/entities/motel.dart';
import '../../../core/errors/failures.dart';

sealed class MotelState {}

class MotelInitial extends MotelState {}

class MotelLoading extends MotelState {}

class MotelSuccess extends MotelState {
  final MotelData motelData;
  MotelSuccess({required this.motelData});
}

class MotelError extends MotelState {
  final BaseException failure;
  MotelError({required this.failure});
}
