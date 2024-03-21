import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app/common/vars.dart';
import 'package:web_app/common/widgets/styles.dart';
import 'package:web_app/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'main',
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: SafeArea(
          child: Center(
            child: SizedBox(
              // color: const Color.fromARGB(255, 227, 241, 249),
              // width: 500,
              width: getValueForScreenType(
                context: context,
                mobile: screenWidth,
                tablet: 500,
                desktop: 500,
              ),
              height: screenHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: kcBlue,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: const SizedBox(
                              width: 48,
                              height: 48,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.home,
                                  semanticLabel: 'back',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Главная',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ), //
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * .25,
                    child: const Text('home_page.dart'),
                  ),

                  /// Сертификат
                  GestureDetector(
                    onTap: () => context.octopus.push(Routes.enterLK),
                    child: SizedBox(
                      width: 300,
                      child: DecoratedBox(
                        decoration: borderedDecorationOpaque(context),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'ЛК получателя сертификата',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// Бронирование
                  GestureDetector(
                    // onTap: () => context.octopus.push(Routes.sertificate),
                    child: SizedBox(
                      width: 300,
                      child: DecoratedBox(
                        decoration: borderedDecorationOpaque(context),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Онлайн бронирование 🔒',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// Партнерка
                  GestureDetector(
                    onTap: () => context.octopus.push(Routes.partnerLogin),
                    child: SizedBox(
                      width: 300,
                      child: DecoratedBox(
                        decoration: borderedDecorationOpaque(context),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Партнерка',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// Admin
                  GestureDetector(
                    // onTap: () {},
                    child: SizedBox(
                      width: 300,
                      child: DecoratedBox(
                        decoration: borderedDecorationOpaque(context),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Админка 🔒',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
