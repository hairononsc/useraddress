import 'package:flutter/widgets.dart';
import 'package:useraddress/models/client.dart';

class ClientSelected with ChangeNotifier {

  
  Client? _client;
  Client? get client => _client;
  set client(Client? newState) {
    _client = newState;
    notifyListeners();
  }
}
