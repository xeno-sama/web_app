import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PartnerNotifier extends ChangeNotifier {
  String partnerLogin = '';
  String partnerPassword = '';
  String partnerPhone = '';
  String partnerSMS = '';
  String partnerCode = '';

  bool isPartnerValidated = false;
  String expirationDate = DateFormat('yyyy.MM.dd').format(DateTime.now());

  void setPartnerLogin(String value) {
    partnerLogin = value;
    isPartnerValidated = partnerLogin.isNotEmpty && partnerPassword.isNotEmpty;
    notifyListeners();
  }

  void setPartnerPassword(String value) {
    partnerPassword = value;
    isPartnerValidated = partnerLogin.isNotEmpty && partnerPassword.isNotEmpty;
    notifyListeners();
  }

  void setPartnerPhone(String value) {
    partnerPhone = value;
    notifyListeners();
  }

  void setPartnerSMS(String value) {
    partnerSMS = value;
    notifyListeners();
  }

  void setPartnerCode(String value) {
    partnerCode = value;
    notifyListeners();
  }
}
