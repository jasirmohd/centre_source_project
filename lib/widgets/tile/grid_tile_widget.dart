import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GridTileWidget extends StatelessWidget {
  const GridTileWidget(
      {Key? key,
      required this.image,
      required this.tag,
      required this.onItemTap})
      : super(key: key);

  final VoidCallback onItemTap;
  final String image;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: onItemTap,
        child: Hero(
          tag: tag,
          child: Container(
            height: 150,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: kIsWeb
                    ? Image.network(
                        image,
                        height: 150,
                        width: 100,
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        imageUrl: image,
                        height: 150,
                        width: 100,
                        placeholder: (context, url) => Container(
                              color: const Color(0xfff5f8fd),
                            ),
                        fit: BoxFit.cover)),
          ),
        ),
      ),
    );
  }
}
