import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {

  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      //  margin: EdgeInsets.all(1),
      child: Column(
        children: [
          Spacer(),
          CircleAvatar(
            radius: 30,
            backgroundImage: CachedNetworkImageProvider(
              "",
            ),
          ),
          Spacer(),
          Text(
            "",
            textAlign: TextAlign.center,
            maxLines: 1,
          )
        ],
      ),
    );
  }
}