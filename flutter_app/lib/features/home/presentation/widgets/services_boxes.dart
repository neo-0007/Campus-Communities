import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServicesBoxes extends StatelessWidget {
  const ServicesBoxes({
    super.key,
    required this.boxColor,
    required this.boxImage,
    required this.boxTitle,
    required this.onTap,
    this.isSvg = true,
  });

  final Color boxColor;
  final String boxImage;
  final String boxTitle;
  final VoidCallback onTap;
  final bool isSvg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: boxColor.withAlpha(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              isSvg
              ?SvgPicture.asset(
                boxImage,
                fit: BoxFit.scaleDown,
                width: 50,
              )
              :Image.asset(boxImage,fit:BoxFit.scaleDown,height:50,),
              SizedBox(height: 5),
              Text(
                boxTitle,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
