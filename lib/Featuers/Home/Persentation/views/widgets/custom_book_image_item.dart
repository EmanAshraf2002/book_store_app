import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookImageItem  extends StatelessWidget{
  const CustomBookImageItem({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6/ 3.4,
        child: CachedNetworkImage(
            imageUrl: imageUrl ,
            fit:BoxFit.fill,
            errorWidget: (context,url,error) =>const  Icon(Icons.error_outline),
        ),
      ),
    );
  }

}