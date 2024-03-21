import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserNotifier extends ChangeNotifier {
  String name = '';
  String phone = '';
  String sertUserPhone = '';
  String sertUserSMS = '';
  String sertCode = '';

  bool isContactValidate = false;
  String expirationDate = DateFormat('yyyy.MM.dd').format(DateTime.now());

  void setName(String value) {
    name = value;
    isContactValidate = name.isNotEmpty && phone.isNotEmpty;
    notifyListeners();
  }

  void setPhone(String value) {
    phone = value;
    isContactValidate = name.isNotEmpty && phone.isNotEmpty;
    notifyListeners();
  }

  void setSertUserPhone(String value) {
    sertUserPhone = value;
    notifyListeners();
  }

  void setSertUserSMS(String value) {
    sertUserSMS = value;
    notifyListeners();
  }

  void setSertCode(String value) {
    sertCode = value;
    notifyListeners();
  }
}
