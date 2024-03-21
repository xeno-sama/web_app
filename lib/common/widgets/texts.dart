import 'package:flutter/material.dart';
import 'package:web_app/common/widgets/styles.dart';

class TextGiftCertificate extends StatelessWidget {
  const TextGiftCertificate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Подарочный',
          style: TextStyle(
              color: Colors.white,
              fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize),
        ),
        Text(
          'СЕРТИФИКАТ',
          style: TextStyle(
              color: Colors.white,
              fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize),
        ), //
      ],
    );
  }
}

class SertificateExpirationDate extends StatelessWidget {
  const SertificateExpirationDate({
    super.key,
    required this.expirationDate,
  });
  final String expirationDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: borderedDecorationWhite(context),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Text(
            'Действует до $expirationDate',
            style: const TextStyle(
                color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class TextEnterLK extends StatelessWidget {
  const TextEnterLK({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Вход в личный кабинет',
            style: Theme.of(context).textTheme.headlineMedium!),
        const SizedBox(height: 20),
        Text('Введите номер телефона, на него придет смс код',
            style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}

class TextEnterSMS extends StatelessWidget {
  const TextEnterSMS({
    super.key,
    required this.smsCode,
  });
  final String smsCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Введите код из смс',
            style: Theme.of(context).textTheme.headlineMedium!),
        const SizedBox(height: 20),
        Text('Введите код из смс, который пришел на ваш номер $smsCode',
            style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}

class TextEnterSertCode extends StatelessWidget {
  const TextEnterSertCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Подарочный сертификат',
            style: Theme.of(context).textTheme.headlineMedium!),
        const SizedBox(height: 20),
        Text('Введите код подарочного сертификата для его активации',
            style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}

class TextApprovement extends StatelessWidget {
  const TextApprovement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Я соглашаюсь с условиями бронирования и обработки персональных данных',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}

class TextQuestionSupport extends StatelessWidget {
  const TextQuestionSupport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Есть вопросы. Связаться с тех.поддержкой',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
