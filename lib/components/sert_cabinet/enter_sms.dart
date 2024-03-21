import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app/common/vars.dart';
import 'package:web_app/common/widgets/styles.dart';
import 'package:web_app/common/widgets/texts.dart';
import 'package:web_app/components/sert_cabinet/model/user_notifier.dart';
import 'package:web_app/routes.dart';

class EnterSMS extends StatelessWidget {
  const EnterSMS({super.key});

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
                    const SizedBox(height: 50),
                    Consumer<UserNotifier>(builder: (context, model, _) {
                      return TextEnterSMS(smsCode: model.sertUserPhone);
                    }),

                    const SizedBox(height: 50),

                    /// Номер телефона с валидацией
                    Consumer<UserNotifier>(builder: (context, model, _) {
                      return TextFormField(
                        // controller: TextEditingController(),
                        initialValue: model.sertUserPhone,
                        onChanged: (value) {
                          context.read<UserNotifier>().setSertUserPhone(value);
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone),
                          labelText: model.sertUserPhone,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 20),

                    /// СМС код
                    TextField(
                      onChanged: (value) {
                        context.read<UserNotifier>().setSertUserSMS(value);
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.sms),
                        labelText: 'Введите код',
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
                      child: Text('Получить новый код'),
                    ),
                    const SizedBox(height: 50),

                    ///
                    GestureDetector(
                      onTap: () {
                        context.read<UserNotifier>().sertUserSMS != ''
                            ? {context.octopus.push(Routes.enterSertificate)}
                            : {};
                      },
                      child:
                          Consumer<UserNotifier>(builder: (context, model, _) {
                        return Container(
                          width: double.maxFinite,
                          decoration: model.sertUserSMS == ''
                              ? borderedDecorationGrey(context)
                              : borderedDecorationBlue(context),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              'Далее',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: model.sertUserSMS != ''
                                          ? Colors.white
                                          : Colors.grey),
                            ),
                          ),
                        );
                      }),
                    ),

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
