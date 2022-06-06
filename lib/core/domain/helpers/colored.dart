import 'package:flutter/material.dart';

class Colored extends Color {
  Colored(dynamic value) : super(_handle(value));

  factory Colored.darken(dynamic value, [double amount = .1]) =>
      _handleLightness(value, amount, '-');

  factory Colored.lighten(dynamic value, [double amount = .1]) =>
    _handleLightness(value, amount, '+');

  static scheme(BuildContext context) => Theme.of(context).colorScheme;

  static backgroundColor(BuildContext context) => Theme.of(context).backgroundColor;

  static schemePrimary(BuildContext context) => Theme.of(context).colorScheme.primary;

  static String toHex(Color color) {
    return '#'
        '${color.alpha.toRadixString(16).padLeft(2, '0')}'
        '${color.red.toRadixString(16).padLeft(2, '0')}'
        '${color.green.toRadixString(16).padLeft(2, '0')}'
        '${color.blue.toRadixString(16).padLeft(2, '0')}';
  }

  static int _handle(dynamic value) {
    if (value is Color) return value.value;

    if (value is int) return value;

    if (value is String) {
      value = value.toUpperCase().replaceAll('#', '');
      if (value.length == 6) value = 'FF' + value;
      return int.parse(value, radix: 16);
    }

    throw ArgumentError('Value must be a string or integer.');
  }

  static _handleLightness(dynamic value, double amount, String operator) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(Colored(value));
    final calc =
        operator == '+' ? (hsl.lightness + amount) : (hsl.lightness - amount);
    final hslLight = hsl.withLightness((calc).clamp(0.0, 1.0));
    return Colored(hslLight.toColor());
  }
}