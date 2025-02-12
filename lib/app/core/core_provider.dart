import 'package:motel_list/app/core/client/client_http_impl.dart';
import 'package:motel_list/app/core/client/i_client_http.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class CoreProvider {
  static List<SingleChildWidget> providers = [
    Provider<IClientHttp>(
      create: (_) => ClientHttpImpl(
        HttpFactory.http(),
        baseUrl: defaultBaseUrl,
      ),
    )
  ];
}
