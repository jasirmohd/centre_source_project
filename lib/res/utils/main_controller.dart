import 'package:get/get.dart';

import '../../api/api_client.dart';

abstract class MainController extends GetxController {
  ApiClient get apiClient => Get.find<ApiClient>();
}
