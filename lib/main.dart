import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:octopus/octopus.dart';
import 'package:provider/provider.dart';
import 'package:web_app/components/partner/model/partner_notifier.dart';
import 'package:web_app/components/sertificate/model/user_notifier.dart';
import 'package:web_app/common/vars.dart';
import 'package:web_app/firebase_options.dart';
import 'package:web_app/routes.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  var router = Octopus(
    routes: Routes.values,
    defaultRoute: Routes.home,
  );

  ///
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    ///
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserNotifier>(
          create: (_) => UserNotifier(),
        ),
        ChangeNotifierProvider<PartnerNotifier>(
            create: (_) => PartnerNotifier()),
      ],

      ///
      child: MaterialApp.router(
        // showSemanticsDebugger: true,
        debugShowCheckedModeBanner: false,
        routerConfig: router.config,
      ),
    );
  }
}

//  splashIconSize: 400,
//         splash: const RiveAnimation.asset('assets/images/opening.riv'),

  // child: MaterialApp.router(
  //       // showSemanticsDebugger: true,
  //       debugShowCheckedModeBanner: false,
  //       routerConfig: router.config,
  //     ),