import 'package:flutter/material.dart';
import 'package:general_counsel/Utils/app_dimentions.dart';
import 'package:general_counsel/Utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.suffixIcon,
      this.labelText,
      this.prefixIcon,
      this.onTap,
      this.isObsecure = false,
      this.fiedlName,
      this.controller});

  final IconData? suffixIcon;
  final String? labelText;
  final String? fiedlName;
  final IconData? prefixIcon;
  final void Function()? onTap;
  final bool isObsecure;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffE6E6E6)),
      borderRadius: BorderRadius.circular(AppDimentions.radiusSmall),
    );
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "$fiedlName field is requred";
        }
        return null;
      },
      controller: controller,
      obscureText: isObsecure,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        prefixIcon: Icon(prefixIcon, size: 20),
        // filled: true,
        hintText: labelText,
        hintStyle: TextStyle(
            fontSize: AppDimentions.fontSizeSmall,
            color: ColorTheme.greyColor.withOpacity(0.6)),
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(suffixIcon, size: 20,color: ColorTheme.greyColor,),
        ),
        enabledBorder: outlineInputBorder,
        focusedErrorBorder: outlineInputBorder,
        errorBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        // fillColor: ,
      ),
    );
  }
}
