import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//const Color primaryColor = Color(0xffef5350); //#982a35 //EDDD34 //b22b39
const Color primaryLight = Color(0xffefd4d7);
const Color whiteColor = Color(0xffffffff);
const Color darkGreen = Color(0xff0FF022420);
const Color buttonIconColor = Color(0xffffffff);
const Color blackColor = Color(0xff000000);
const Color textColor = Color(0xff000000);
const Color lightGrey = Color(0xfff2f2f3);
const Color colorGrey = Color(0xff676A6C);
const Color orangeColor = Color(0xffffd90d); //#ffd90d //ff5722 //fed700
const Color greenColor = Color(0xff43a047);
const Color lightredColor = Color(0xffe57373);
const Color appbarbgcolor = Color(0xFFFDF3E8);
const Color scaffbgcolor = Color(0xFFFDF3E8);

final List<Color> staticColors = [
  Colors.blue,
  Colors.red,
  Colors.deepOrangeAccent,
  Colors.green,
  Colors.orange,
];

Color getRandomColor(int index) {
  return staticColors[index % staticColors.length];
}

Color getCategoryColor() {
  final random = Random();
  return categoriesColors[random.nextInt(categoriesColors.length)];
}

// -------- Categroies Color Code------------
final List<Color> categoriesColors = [
  Color(0xffFAF4E2),
  Color(0xffFAEAE2),
  Color(0xffEEE7F9),
  Color(0xffE7EEFA),
  Color(0xffFAE1EC),
  Color(0xffFAEAE2),
];
final List<Color> catBorderColors = [
  Color(0xFFF8D97E),
  Color(0xFFF5B291),
  Color(0xFFB891F7),
  Color(0xFF9ABBF4),
  Color(0xFFF69FC5),
  Color(0xFFF3B99C),
];

InputDecoration phoneNumberInputDecoration({String? hitText}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 10),
    isDense: true,
    focusColor: Colors.black,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(100.w),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(100.w),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(100.w),
    ),
    fillColor: Colors.white,
    hintText: '$hitText',
    hintStyle: Get.theme.textTheme.bodyMedium!.copyWith(
      color: Colors.grey,
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
    ),
  );
}

BoxDecoration scafdecoration = const BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [appbarbgcolor, Color(0xFFE1F0FF)],
  ),
);
