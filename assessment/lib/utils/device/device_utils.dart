import 'package:flutter/material.dart';

// Helper class for device related operations.
class DeviceUtils {
  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }}