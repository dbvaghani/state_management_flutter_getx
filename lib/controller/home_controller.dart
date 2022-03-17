import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  bool status = true;

  int followers = 50;

  void updateStatus() {
    status = !status;
    update(["status_widget"]);
  }
}
