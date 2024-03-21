import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app/common/vars.dart';
import 'package:web_app/common/widgets/styles.dart';
import 'package:web_app/components/sert_cabinet/model/user_notifier.dart';
import 'package:web_app/routes.dart';

class InputContactsAndStartPayment extends StatelessWidget {
  const InputContactsAndStartPayment({super.key});

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
                            onTap: () =>
                                context.octopus.push(Routes.sertificate),
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
                          Text('Введите контакты',
                              style:
                                  Theme.of(context).textTheme.headlineSmall!),

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

                    /// Обертка UserNotifier
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: TextField(
                        onChanged: (value) {
                          context.read<UserNotifier>().setName(value);
                        },
                        decoration: const InputDecoration(
                          labelText: 'Ваше Имя',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// Номер телефона с валидацией
                    TextField(
                      onChanged: (value) {
                        context.read<UserNotifier>().setPhone(value);
                      },
                      decoration: const InputDecoration(
                        labelText: 'Номер телефона',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                    ),

                    /// заметка оставить телефон
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                          'Оставьте пожалуйста телефон с вотсапом, туда придет подтверждение вашей брони'),
                    ),

                    /// Важное замечание
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        width: double.maxFinite,
                        decoration: borderedDecorationLight(context),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'Важная информация',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 15),
                              child: Text(
                                'У вас должен быть опыт вождения мотоциклом.\nУ вас должна быть справка о разрешение на стрельбу из оружия.',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///! Начать оформление Бронирования
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Расчет цены
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              width: double.maxFinite,
                              decoration: borderedDecorationWhite(context),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Стоимость',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      Text(
                                        '4 600 ₽',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Доплата на месте',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      Text(
                                        '0 ₽',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'к оплате',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '4 600 ₽',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          /// Кнопка бронирования
                          GestureDetector(
                            onTap: () {
                              context.read<UserNotifier>().isContactValidate
                                  ? {context.octopus.push(Routes.sertificate)}
                                  : {};
                            },
                            child: Container(
                              width: double.maxFinite,
                              decoration: borderedDecorationGrey(context),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Consumer<UserNotifier>(
                                    builder: (context, model, _) {
                                  return Text(
                                    'Забронировать',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            color: model.isContactValidate
                                                ? Colors.black
                                                : Colors.grey),
                                  );
                                }),
                              ),
                            ),
                          ),

                          /// Согласие с условиями
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              'Я соглашаюсь с условиями бронирования и обработки персональных данных',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
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
