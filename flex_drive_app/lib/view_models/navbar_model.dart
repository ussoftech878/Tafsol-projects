import 'package:flutter/foundation.dart';

enum SelectedTab { home, cardManagement, profile }

class BottomNavModel extends ChangeNotifier {
  var selectedTab = SelectedTab.home;

  void changeTab(int index) {
    selectedTab = SelectedTab.values[index];
    notifyListeners();
  }

  void changeTabToHome() {
    selectedTab = SelectedTab.home;
    //notifyListeners();
  }



  
}
