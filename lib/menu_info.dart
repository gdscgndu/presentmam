import 'package:flutter/foundation.dart';
import 'enums.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String title;
  String imagePath;

  MenuInfo(this.menuType, this.title, this.imagePath);
  updateMenu(MenuInfo menuInfo) {
    this.menuType = menuInfo.menuType;
    this.title = menuInfo.title;
    this.imagePath = menuInfo.imagePath;

    // Its very important to notify listeners to update the state, else will not see any changes
    notifyListeners();
  }
}
