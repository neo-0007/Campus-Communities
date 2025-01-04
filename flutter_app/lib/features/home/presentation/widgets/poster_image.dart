import 'package:flutter/material.dart';

class PosterImage extends StatelessWidget {
  const PosterImage({super.key, required this.imagePath, this.onTap,this.isNetworkImage=false});

  final String imagePath;
  final bool isNetworkImage;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            image: isNetworkImage
                ? NetworkImage(imagePath)
                : AssetImage(
                    imagePath,
                  ) as ImageProvider,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
