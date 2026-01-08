/// A calculator that adds numbers from a string input.
class StringCalculator {
  /// Adds numbers in the given string and returns the sum.
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    return int.parse(numbers);
  }
}
