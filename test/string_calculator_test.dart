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
  test('should return sum for two comma-separated numbers', () {
    expect(calculator.add('1,4'), 5);
  });
  test('should handle any amount of numbers', () {
    expect(calculator.add('1,2,3,4'), 10);
  });
  test('should handle new lines between numbers', () {
    expect(calculator.add('1\n2,3'), 6);
  });
  test('supports custom single-char delimiter', () {
    expect(calculator.add('//;\n1;2'), 3);
  });
  test('supports multi-character delimiter', () {
    expect(calculator.add('//[***]\n1***2***3'), 6);
  });

  test('supports multiple delimiters', () {
    expect(calculator.add('//[*][%]\n1*2%3'), 6);
  });
  test('supports multiple multi-character delimiters', () {
    expect(calculator.add('//[***][%%]\n1***2%%3'), 6);
  });
  test('throws exception for negative numbers', () {
    expect(() => calculator.add('-1,2'), throwsA(isA<Exception>()));
  });
  test('shows all negative numbers in exception message', () {
    expect(
      () => calculator.add('-1,2,-3'),
      throwsA(
        predicate(
          (e) =>
              e is Exception &&
              e.toString().contains('-1') &&
              e.toString().contains('-3'),
        ),
      ),
    );
  });
  test('ignores numbers greater than 1000', () {
    expect(calculator.add('2,1001'), 2);
  });
}
