import 'package:get/get.dart';
import 'package:pix/page/image_view/image_view_controller.dart';

class ImageViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImageViewController());
  }
}
