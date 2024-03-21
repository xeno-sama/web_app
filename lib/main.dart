import 'package:octopus/octopus.dart';
import 'package:provider/provider.dart';
import 'package:web_app/components/sert_cabinet/model/user_notifier.dart';
import 'package:web_app/common/vars.dart';
import 'package:web_app/routes.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // DB.realm = await openRealm();

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