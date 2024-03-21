import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:octopus/octopus.dart';
import 'package:web_app/components/admin/admin_page.dart';
import 'package:web_app/components/partner/partner_add_brand.dart';
import 'package:web_app/components/partner/partner_main.dart';
import 'package:web_app/home_page.dart';
import 'package:web_app/components/sertificate/login_lk.dart';
import 'package:web_app/components/sertificate/enter_code_sert.dart';
import 'package:web_app/components/sertificate/enter_sms.dart';
import 'package:web_app/components/sertificate/input_contacts.dart';
import 'package:web_app/components/partner/partner_login.dart';
import 'package:web_app/components/sertificate/sert_page.dart';

enum Routes with OctopusRoute {
  home('home', title: 'Home'),
  sertificate('sertificate', title: 'Sertificate'),
  inputContacts('inputContacts', title: 'InputContacts'),

  /// Личный кабинет получателя сертификата
  enterLK('enterLK', title: 'EnterLK'),
  enterSMS('enterSMS', title: 'EnterSMS'),
  enterSertificate('enterSertificate', title: 'EnterSertificate'),

  /// Кабинет Партнера
  partnerLogin('partner', title: 'Partner'),
  partnerMain('partnerMain', title: 'PartnerMain'),
  partnerAddBrand('partnerAddBrand', title: 'PartnerAddBrand'),

  /// Админка
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
        Routes.partnerLogin => const PartnerLogin(),
        Routes.partnerMain => const PartnerMain(),
        Routes.partnerAddBrand => const PartnerAddBrand(),

        ///
        Routes.admin => const AdminPage(),
      };
}
