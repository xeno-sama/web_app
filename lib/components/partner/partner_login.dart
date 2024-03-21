import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app/common/vars.dart';
import 'package:web_app/common/widgets/styles.dart';
import 'package:web_app/common/widgets/texts.dart';
import 'package:web_app/components/partner/model/partner_notifier.dart';
import 'package:web_app/routes.dart';

class PartnerLogin extends StatelessWidget {
  const PartnerLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'main',
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              color: Colors.white,
              width: getValueForScreenType(
                context: context,
                mobile: screenWidth,
                tablet: 500,
                desktop: 500,
              ),
              height: screenHeight,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Кнопка назад и заголовок
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => context.octopus.push(Routes.enterLK),
                            child: Container(
                              decoration: borderedDecorationOpaque(context),
                              width: 48,
                              height: 48,
                              child: const Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  semanticLabel: 'back',
                                ),
                              ),
                            ),
                          ),

                          /// Home
                          GestureDetector(
                            onTap: () => context.octopus.push(Routes.home),
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 10, top: 10),
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.home,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                      child: Text('partner_login.dart'),
                    ),
                    Text('Личный кабинет',
                        style: Theme.of(context).textTheme.headlineMedium!),

                    const SizedBox(height: 50),

                    /// Логин партнера
                    Consumer<PartnerNotifier>(builder: (context, model, _) {
                      return TextFormField(
                        // controller: TextEditingController(),
                        initialValue: model.partnerLogin,
                        onChanged: (value) {
                          context
                              .read<PartnerNotifier>()
                              .setPartnerLogin(value);
                        },
                        decoration: const InputDecoration(
                          // prefixIcon: const Icon(Icons.phone),
                          labelText: 'Введите логин',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 20),

                    /// Пароль партнера
                    TextField(
                      onChanged: (value) {
                        context
                            .read<PartnerNotifier>()
                            .setPartnerPassword(value);
                      },
                      decoration: const InputDecoration(
                        // prefixIcon: Icon(Icons.sms),
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        labelText: 'Введите пароль',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text('Забыли пароль'),
                    ),
                    const SizedBox(height: 50),

                    /// Войти
                    Consumer<PartnerNotifier>(builder: (context, model, _) {
                      return GestureDetector(
                        onTap: () {
                          model.partnerLogin != '' &&
                                  model.partnerPassword != ''
                              ? {context.octopus.push(Routes.partnerMain)}
                              : {};
                        },
                        child: Consumer<PartnerNotifier>(
                            builder: (context, model, _) {
                          return Container(
                            width: double.maxFinite,
                            decoration: model.partnerLogin == '' ||
                                    model.partnerPassword == ''
                                ? borderedDecorationGrey(context)
                                : borderedDecorationBlue(context),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              child: Text(
                                'Войти',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: model.partnerLogin != '' &&
                                                model.partnerPassword != ''
                                            ? Colors.white
                                            : Colors.grey),
                              ),
                            ),
                          );
                        }),
                      );
                    }),

                    ///
                    const Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          /// Согласие с условиями
                          Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: TextQuestionSupport(),
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
