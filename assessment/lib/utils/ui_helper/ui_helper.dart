import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';

class UIHelper {
// Ensure singleton
  static final UIHelper _instance = UIHelper._privateConstructor();
  final _appColors = AppColors.instance;
 static UIHelper get instance => _instance;

  UIHelper._privateConstructor();

  final _strings = Strings.instance;

  getImageAsset(String imageURL, double height, double width) {
    return Image.asset(imageURL, width: width, height: height);
  }


  // getToast(String text, Color bgColor, Color textColor) {
  //   return Fluttertoast.showToast(
  //       msg: text,
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.BOTTOM,
  //       backgroundColor: bgColor,
  //       textColor: textColor,
  //       timeInSecForIosWeb: 2,
  //       fontSize: 16.0);
  // }


  Text setButtonText(String buttonLabel, Color textColor, double fontSize,
      FontWeight fontWeight, TextAlign textAlign) {
    return Text(
      buttonLabel,
      textAlign: textAlign,
      style: TextStyle(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight),
    );
  }

  getBorderOutlineInfo(int colorIndex) {
    return OutlineInputBorder(
      borderSide: BorderSide(
          color: (colorIndex == 1)
              ? _appColors.remainingColor
              : _appColors.spentColor,
          width: 10),
    );
  }

  getSearchBorderOutlineInfo(int colorIndex) {
    return OutlineInputBorder(
      borderSide: BorderSide(
          color: (colorIndex == 1)
              ? _appColors.remainingColor
              : _appColors.spentColor,
          style: BorderStyle.solid,
          width: 1.5),
    );
  }

  // getInputDecoration(String labelText, String characterCounter, double fontSize,
  //     {Color fillColor = Colors.white}) {
  //   return InputDecoration(
  //       counterText: characterCounter,
  //       labelText: labelText,
  //       labelStyle: getTextStyle(fontSize, 1),
  //       focusedBorder: getBorderOutlineInfo(1),
  //       enabledBorder: getBorderOutlineInfo(1),
  //       fillColor: fillColor);
  // }

  getInputDecorationStyle(
      String labelText,
      String characterCounter,
      double fontSize,
      String fontFamily,
      FontStyle fontStyle,
      FontWeight fontWeight) {
    return InputDecoration(
      counterText: characterCounter,
      labelText: labelText,
      labelStyle:
          MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
        final Color color = states.contains(MaterialState.focused)
            ? _appColors.spentColor
            : _appColors.remainingColor;
        return TextStyle(color: color);
      }),
      focusedBorder: getBorderOutlineInfo(1),
      enabledBorder: getBorderOutlineInfo(2),
    );
  }

  getSearchInputDecorationStyle(
      String labelText,
      String characterCounter,
      double fontSize,
      String fontFamily,
      FontStyle fontStyle,
      FontWeight fontWeight) {
    return InputDecoration(
      counterText: characterCounter,
      labelText: labelText,
      labelStyle:
          MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
        final Color color = states.contains(MaterialState.focused)
            ? _appColors.remainingColor
            : _appColors.spentColor;
        return TextStyle(color: color);
      }),
      focusedBorder: getSearchBorderOutlineInfo(1),
      enabledBorder: getSearchBorderOutlineInfo(2),
    );
  }
}
