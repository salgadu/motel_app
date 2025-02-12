import 'package:motel_list/app/core/types/types.dart';
import 'package:motel_list/app/motel/interactor/entities/motel.dart';

abstract class IMotelRepository {
  Future<Output<MotelData>> getMotelList(int? index);
}
