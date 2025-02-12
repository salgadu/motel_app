import 'package:flutter/material.dart';
import 'package:motel_list/app/motel/interactor/repositories/i_motel_repository.dart';
import 'package:motel_list/app/motel/interactor/states/motel_state.dart';

class MotelController extends ChangeNotifier {
  final IMotelRepository? _motelRepository;

  MotelController(this._motelRepository);

  MotelState state = MotelInitial();

  setSate(MotelState newState) {
    state = newState;
    notifyListeners();
  }

  Future<void> fetchMotelData({int? index}) async {
    setSate(MotelLoading());

    final result = await _motelRepository!.getMotelList(index);
    result.fold((sucess) {
      setSate(MotelSuccess(motelData: sucess));
    }, (error) {
      setSate(MotelError(failure: error));
    });
  }
}
