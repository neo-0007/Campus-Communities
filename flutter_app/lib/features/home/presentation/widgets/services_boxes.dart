import 'package:flutter/material.dart';

class ServicesBoxes extends StatelessWidget {
  const ServicesBoxes({
    super.key,
    required this.boxColor,
    required this.boxImage,
    required this.boxTitle,
    required this.onTap,
  });

  final Color boxColor;
  final String boxImage;
  final String boxTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: boxColor.withAlpha(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(boxImage,fit:BoxFit.scaleDown,height:50,),
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
