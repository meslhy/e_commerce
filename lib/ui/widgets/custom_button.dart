import 'package:e_commerce/ui/utils/app_color.dart';
import 'package:flutter/material.dart';


class CustomButtonWidget extends StatelessWidget {
  String title;
  Function()? onPressed;
  CustomButtonWidget({required this.title, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 18),
        backgroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: onPressed,
      child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}