import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix/page/image_view/image_view_binding.dart';
import 'package:pix/page/image_view/image_view_page.dart';
import 'package:pix/res/utils/main_controller.dart';
import 'package:pix/res/values/strings.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../model/image_response.dart';
import '../../widgets/text/text_widget.dart';

class HomeController extends MainController {
  RxList<ImageData> imageDataList = RxList([]);
  final TextEditingController searchController = TextEditingController();
  RxInt pageNo = 1.obs;
  RxBool hasMoreData = true.obs;
  RxBool loading = true.obs;
  RxBool hasConnection = false.obs;

  @override
  void onInit() {
    checkInternetConnection();
    super.onInit();
  }

  ///getting image details from pixabay api
  getImageFromApi(String searchText, int page) async {
    final imageResponse =
        await apiClient.getMethod(searchText: searchText, pageNo: page);
    if (imageResponse.hits.isNotEmpty) {
      dynamic imageList = imageResponse.hits;
      for (int i = 0; i < imageList.length; i++) {
        String imageDataEncode = jsonEncode(imageList[i]);
        final imageDataDecode = jsonDecode(imageDataEncode);
        ImageData data = ImageData.fromJson(imageDataDecode);
        imageDataList.add(data);
      }
      hasMoreData.value = true;
      pageNo.value += 1;
      loading.value = false;
    } else {
      pageNo.value = 1;
      hasMoreData.value = false;
      loading.value = false;
      errorPopUp(caption1: Strings.tDataNotFound);
    }
  }

  ///checking device is connected to internet or not
  void checkInternetConnection() async {
    InternetConnectionChecker().onStatusChange.listen((status) async {
      if (status == InternetConnectionStatus.connected) {
        hasConnection.value = true;
          await getImageFromApi('', pageNo.value);
      } else {
        hasConnection.value = false;
        loading.value = false;
        errorPopUp(caption1: Strings.tNoInternet, caption2: Strings.tRetry);
      }
    });
  }

  ///getting more data when scrolling
  void loadMoreData() async {
    await getImageFromApi(searchController.text, pageNo.value);
  }

  ///getting search data when search icon pressed
  void onIconTap() async {
    pageNo.value = 1;
    imageDataList.clear();
    loading.value = true;
    await getImageFromApi(searchController.text, pageNo.value);
  }

  ///going to image view page when item clicked
  void onItemTap(int index) {
    Get.to(() => ImageViewPage(),
        binding: ImageViewBinding(),
        arguments: {Strings.tImageData: imageDataList[index]});
  }

  errorPopUp({required String caption1, String? caption2}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: caption2 != null
          ? SizedBox(
              height: 40,
              child: Column(
                children: [
                  TextWidget(
                      text: caption1, textColor: Colors.white, textSize: 18),
                  TextWidget(
                      text: caption2, textColor: Colors.white, textSize: 16)
                ],
              ),
            )
          : TextWidget(text: caption1, textColor: Colors.white, textSize: 18),
      // margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      backgroundColor: Colors.green,
      elevation: 10,
      duration: const Duration(seconds: 4),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ));
  }
}
