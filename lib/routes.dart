import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:octopus/octopus.dart';
import 'package:web_app/components/admin_page.dart';
import 'package:web_app/components/home_page.dart';
import 'package:web_app/components/sert_cabinet/enter_lk.dart';
import 'package:web_app/components/sert_cabinet/enter_sert.dart';
import 'package:web_app/components/sert_cabinet/enter_sms.dart';
import 'package:web_app/components/sert_cabinet/input_contacts.dart';
import 'package:web_app/components/partner_page.dart';
import 'package:web_app/components/sert_page.dart';

enum Routes with OctopusRoute {
  home('home', title: 'Home'),
  sertificate('sertificate', title: 'Sertificate'),
  inputContacts('inputContacts', title: 'InputContacts'),

  /// Личный кабинет получателя сертификата
  enterLK('enterLK', title: 'EnterLK'),
  enterSMS('enterSMS', title: 'EnterSMS'),
  enterSertificate('enterSertificate', title: 'EnterSertificate'),

  ///
  partner('partner', title: 'Partner'),
  admin('admin', title: 'Admin'),
  ;

  const Routes(this.name, {this.title});

  @override
  final String name;

  @override
  final String? title;

  @override
  Widget builder(BuildContext context, OctopusState state, OctopusNode node) =>
      switch (this) {
        Routes.home => const HomePage(),
        Routes.sertificate => const SertificatePage(),
        Routes.inputContacts => const InputContactsAndStartPayment(),

        ///
        Routes.enterLK => const EnterLK(),
        Routes.enterSMS => const EnterSMS(),
        Routes.enterSertificate => const EnterSertificate(),

        ///
        Routes.partner => const PartnerPage(),
        Routes.admin => const AdminPage(),
      };
}
