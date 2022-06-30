import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_loading_list/lazy_loading_list.dart';
import 'package:pix/page/home/home_controller.dart';
import 'package:pix/widgets/loading/loading_widget.dart';
import 'package:pix/widgets/text/text_widget.dart';
import 'package:pix/widgets/text_field/text_field_widget.dart';
import 'package:pix/widgets/tile/grid_tile_widget.dart';

import '../../res/values/strings.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 0,
              child: Container(
                padding: const EdgeInsets.only(
                    top: 35, left: 10, right: 10, bottom: 20),
                child: Column(
                  children: [
                    const TextWidget(
                        text: Strings.tAppName,
                        textColor: Colors.green,
                        textSize: 25,
                        textWeight: FontWeight.bold),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFieldWidget(
                          controller: controller.searchController,
                          hint: Strings.tSearchHere,
                          iconSize: 35,
                          onIconTap: controller.onIconTap,
                          icon: Icons.search),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => controller.loading.value
                      ? const Center(child: LoadingWidget())
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: controller.imageDataList.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return LazyLoadingList(
                                loadMore: controller.loadMoreData,
                                index: index,
                                hasMore: controller.hasMoreData.value,
                                child: GridTileWidget(
                                  tag: controller.imageDataList[index].tags ??
                                      '',
                                  onItemTap: () => controller.onItemTap(index),
                                  image: controller
                                      .imageDataList[index].largeImageUrl,
                                ));
                          },
                        ),
                ),
              ))
        ],
      ),
    );
  }
}
