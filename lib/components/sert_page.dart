import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app/common/vars.dart';
import 'package:web_app/common/widgets/styles.dart';
import 'package:web_app/common/widgets/texts.dart';
import 'package:web_app/components/sert_cabinet/model/user_notifier.dart';
import 'package:web_app/routes.dart';

class SertificatePage extends StatelessWidget {
  const SertificatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'order',
      child: Scaffold(
        body: Center(
          child: Container(
            color: kcBlue,
            width: getValueForScreenType(
              context: context,
              mobile: screenWidth,
              tablet: 500,
              desktop: 500,
            ),
            height: screenHeight,
            child: Scrollbar(
              // thumbVisibility: true,
              trackVisibility: true,
              child: ListView(
                children: [
                  // Back & Home
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            context.octopus.push(Routes.enterSertificate),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
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
                              child: Icon(
                                Icons.home,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// Title Подарочный Сертификат
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                      bottom: 30,
                    ),
                    child: TextGiftCertificate(),
                  ),

                  /// сертификат и действия
                  Column(
                    children: [
                      /// Срок действия
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: SertificateExpirationDate(
                          expirationDate:
                              context.read<UserNotifier>().expirationDate,
                        ),
                      ),

                      /// Main Бронь
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          width: double.maxFinite,
                          decoration: borderedDecorationWhite(context),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 15, top: 15),
                                child: Text('Квадроциклы'),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 15, top: 8),
                                child: Text(
                                  'Маршрут экстрим 1 час',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 8),
                                child: Text(
                                  'ул. Ленина, 1',
                                  style: TextStyle(color: kcBlue),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 15, top: 8),
                                child: Text('2шт - Доплата за пассажира'),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 15, top: 8),
                                child: Text(
                                    '1шт - Двухместный квадроцикл 800 кубов'),
                              ),

                              /// Запись на услугу
                              GestureDetector(
                                onTap: () =>
                                    context.octopus.push(Routes.inputContacts),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, top: 20, right: 15),
                                  child: Container(
                                    decoration: borderedDecorationBlue(context),
                                    child: const Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Text(
                                          'Записаться на услугу',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              /// Подробнее о услуге
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, top: 10, right: 15),
                                child: Container(
                                  decoration: borderedDecorationLight(context),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Text(
                                        'Подробнее о услуге',
                                        style: TextStyle(
                                            color: kcBlue,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              /// Измениь состав заказа
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, top: 10, right: 15, bottom: 10),
                                child: Container(
                                  decoration: borderedDecorationLight(context),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Text(
                                        'Изменить состав заказа',
                                        style: TextStyle(
                                            color: kcBlue,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// Описание поздравление
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 20, right: 20, bottom: 20),
                        child: Container(
                          width: double.maxFinite,
                          decoration: borderedDecorationWhite(context),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 15,
                                  top: 15,
                                ),
                                child: Text(
                                  'Поздравление',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, top: 15, right: 15, bottom: 15),
                                child: Text(
                                  'Конная прогулка для Вас двоих, включая прогулку на квадроциклах, Всего хорошего!',
                                  style: TextStyle(color: kcBlue),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 15, bottom: 15),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('Виктор'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// Footer
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Text(
                          'Консультация: +795 923-81-95',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Связаться с техподдержкой',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
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
