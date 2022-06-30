import 'package:get/get.dart';
import 'package:pix/api/api_client.dart';
import 'package:pix/page/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient());
    Get.lazyPut(() => HomeController());
  }
}
