import 'package:flutter_test/flutter_test.dart';

import 'package:string_calculator_tdd/string_calculator.dart';

void main() {
  final calculator = StringCalculator();

  test('should return 0 for empty string', () {
    expect(calculator.add(''), 0);
  });
  test('should return the number for single input', () {
    expect(calculator.add('1'), 1);
  });
}
