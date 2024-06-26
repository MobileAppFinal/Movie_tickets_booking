import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputValidator {
  static bool validateField(String title, String value) {
    if (value.trim().isNotEmpty) {
      return true;
    }
    Get.snackbar(
      "Lỗi",
      "$title trống",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
    return false;
  }

  static bool validatePassword(String value1, String value2) {
    if (value1.trim() == value2.trim()) {
      return true;
    }
    Get.snackbar(
      "Lỗi",
      "Mật khẩu nhập lại không khớp",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
    return false;
  }
}