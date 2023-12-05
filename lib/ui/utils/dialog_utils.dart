import 'package:e_commerce/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

 showLoading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return const AlertDialog(
          content: Row(
            children: [
              Text(
                "Loading...",
                style: TextStyle(color: AppColors.primaryColor),
              ),
              Spacer(),
              CircularProgressIndicator(),
            ],
          ),
        );
      });
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}

void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            "Error",
            style: TextStyle(color: AppColors.primaryColor),
          ),
          content: Text(
            errorMessage,
            style: const TextStyle(color: AppColors.blackColor),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok"))
          ],
        );
      });
}