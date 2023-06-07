import 'package:connectivity_plus/connectivity_plus.dart';

void checkInternetConnection() async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    print("conectado a uma conexão de dados");
  } else if (connectivityResult == ConnectivityResult.wifi) {
    print("conectado a uma conexão wifi");
  } else {
    print("sem conexão");
  }
}
