import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix/page/image_view/image_view_controller.dart';
import 'package:pix/widgets/button/icon_button_widget.dart';
import 'package:pix/widgets/column_tile/column_tile_widget.dart';
import 'package:pix/widgets/text/text_widget.dart';

class ImageViewPage extends GetView<ImageViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButtonWidget(
                  onIconTap: () => controller.backPress(),
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  iconSize: 35),
            ),
            Expanded(
                flex: 1,
                child: Image.network(
                  controller.imageData!.largeImageUrl,
                  height: Get.height,
                  width: Get.width,
                  fit: BoxFit.contain,
                )),
            Expanded(
              flex: 0,
              child: Center(
                child: TextWidget(
                  text: controller.imageData!.tags ?? '',
                  textColor: Colors.white,
                  textSize: 18,
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColumnTileWidget(
                      color: Colors.white,
                      text: controller.imageData!.likes.toString(),
                      textSize: 16,
                      iconSize: 35,
                      icon: Icons.favorite_border,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ColumnTileWidget(
                      color: Colors.white,
                      text: controller.imageData!.comments.toString(),
                      textSize: 16,
                      iconSize: 35,
                      icon: Icons.comment_outlined,
                    ),
                    // ColumnTileWidget(
                    //     color: Colors.white,
                    //     text: controller.imageData.views.toString(),
                    //     textSize: 16,
                    //     iconSize: 35,
                    //     icon: Icons.view,
                    //     textWeight: textWeight),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
