import 'package:motel_list/app/core/client/i_client_http.dart';
import 'package:motel_list/app/motel/data/repositories/motel_repository_impl.dart';
import 'package:motel_list/app/motel/interactor/controllers/motel_controller.dart';
import 'package:motel_list/app/motel/interactor/repositories/i_motel_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MotelProvider {
  static List<SingleChildWidget> providers = [
    ProxyProvider<IClientHttp, IMotelRepository>(
      update: (_, client, __) => MotelRepositoryImpl(client),
    ),
    ChangeNotifierProvider(
      create: (context) => MotelController(context.read<IMotelRepository>()),
    ),
  ];
}
