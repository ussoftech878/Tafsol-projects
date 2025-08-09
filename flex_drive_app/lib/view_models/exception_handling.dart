import 'package:flutter/widgets.dart';

class ExceptionHandling extends ChangeNotifier {
  bool get getShowDialogBox => _showDialogBox;
  bool _showDialogBox = true;

  setShowDialogBoxBool(bool bool) {
    _showDialogBox = bool;
    notifyListeners();
  }

  List<Function> listOfAPi = [];

  Future<void> runAllApis() async {
    List<Function> apiCopy = List.from(listOfAPi);
    for (var api in apiCopy) {
      var result = await api();
    }
  }
}
