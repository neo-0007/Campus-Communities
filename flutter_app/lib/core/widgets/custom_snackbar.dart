import 'package:flutter/material.dart';

class CustomSnackbar {
  CustomSnackbar({
    required this.snackBarColor,
    required this.snackBarBorderColor,
    required this.snackBarIcon,
    required this.snackBarText,
    required this.snackBarSubText,
  });

  final Color snackBarColor;
  final Color snackBarBorderColor;
  final IconData snackBarIcon;
  final String snackBarText;
  final String snackBarSubText;

  void show(BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Container(
        width: double.infinity,
        height: 70,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: snackBarBorderColor.withAlpha(98),
            width: 2,
          ),
          color: snackBarColor.withAlpha(28),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: snackBarColor,
                borderRadius: BorderRadius.circular(25),
              ),
              alignment: Alignment.center,
              child: Icon(
                snackBarIcon,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    snackBarText,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    snackBarSubText,
                    style: TextStyle(
                      color: Colors.black.withAlpha(50),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: SizedBox(
                width: 35,
                height: 35,
                child: Icon(
                  Icons.close,
                  color: Colors.black.withAlpha(80),
                ),
              ),
            ),
          ],
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 16),
      duration: const Duration(seconds: 3),
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
