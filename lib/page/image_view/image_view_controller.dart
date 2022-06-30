import 'package:get/get.dart';
import 'package:pix/res/values/strings.dart';
import 'package:pix/model/image_response.dart';

class ImageViewController extends GetxController {
  dynamic arguments = Get.arguments;
  ImageData? imageData;

  @override
  void onInit() {
    imageData = arguments[Strings.tImageData];
  }

  backPress() {
    Get.back();
  }
}
