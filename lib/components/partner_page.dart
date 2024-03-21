import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app/common/vars.dart';
import 'package:web_app/routes.dart';

class PartnerPage extends StatelessWidget {
  const PartnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'partner',
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Center(
          child: SizedBox(
            width: getValueForScreenType(
                context: context,
                mobile: screenWidth,
                // tablet: screenWidth,
                desktop: 500),
            height: screenHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Theme.of(context).colorScheme.inversePrimary,
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
                                Icons.arrow_back_ios_new,
                                semanticLabel: 'back',
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Партнерка',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ), //
                      ],
                    ),
                  ),
                ),

                /// Back
                SizedBox(
                  // width: screenWidth,
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(
                        left: 15, right: 10, top: 0, bottom: 0),
                    title: Text('Назад',
                        style: Theme.of(context).textTheme.titleMedium),
                    leading: const SizedBox(
                      width: 30,
                      child: Center(
                        child: Icon(Icons.open_with_rounded),
                      ),
                    ),
                    onTap: () => context.octopus.push(Routes.home),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
