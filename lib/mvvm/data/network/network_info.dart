

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo{

  InternetConnection internetConnection;

  NetworkInfoImpl(this.internetConnection);

  @override
  Future<bool> get isConnected => internetConnection.hasInternetAccess;

}