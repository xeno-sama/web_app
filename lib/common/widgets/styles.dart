import 'package:flutter/material.dart';

BoxDecoration borderedDecorationOpaque(BuildContext context) => BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: Theme.of(context).colorScheme.onSurface,
        width: .2,
      ),
    );

BoxDecoration borderedDecorationWhite(BuildContext context) => BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    );

BoxDecoration borderedDecorationBlue(BuildContext context) => BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: const Color.fromARGB(255, 33, 89, 243),
    );

BoxDecoration borderedDecorationLight(BuildContext context) => BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: const Color.fromARGB(255, 216, 228, 253),
      border: Border.all(
        color: Theme.of(context).colorScheme.onSurface,
        width: .2,
      ),
    );

BoxDecoration borderedDecorationGrey(BuildContext context) => BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: const Color.fromARGB(255, 203, 207, 215),
      border: Border.all(
        color: Theme.of(context).colorScheme.onSurface,
        width: .2,
      ),
    );
