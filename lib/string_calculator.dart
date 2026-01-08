/// A calculator that adds numbers from a string input.
class StringCalculator {
  /// Adds numbers in the given string and returns the sum.
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    var parts = numbers.split(',');
    var sum = 0;
    for (var p in parts) {
      sum += int.parse(p);
    }
    return sum;
  }
}
