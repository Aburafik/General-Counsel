import 'package:flutter/material.dart';
import 'package:general_counsel/Utils/app_dimentions.dart';
import 'package:general_counsel/Utils/colors.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    this.onPressed,
    this.title,
    this.backgroundColor,
  });
  final String? title;
  final void Function()? onPressed;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimentions.radiusSmall),
            side: backgroundColor == null
                ? const BorderSide(color: ColorTheme.secondaryColor)
                : BorderSide.none),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Text(
          title!,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: backgroundColor == null
                  ? ColorTheme.secondaryColor
                  : ColorTheme.whiteColor,
              fontFamily: "Cairo"),
        ),
      ),
    );
  }
}
