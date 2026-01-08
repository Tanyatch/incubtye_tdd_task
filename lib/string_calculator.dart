/// A calculator that adds numbers from a string input.
class StringCalculator {
  /// Adds numbers in the given string and returns the sum.
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    var delimiter = ',';
    var numString = numbers;

    if (numbers.startsWith('//')) {
      var newlineIndex = numbers.indexOf('\n');
      delimiter = numbers.substring(2, newlineIndex);
      numString = numbers.substring(newlineIndex + 1);
    }

    var normalized = numString.replaceAll('\n', delimiter);
    var parts = normalized.split(delimiter);
    return parts.map((p) => int.parse(p)).fold(0, (a, b) => a + b);
  }
}
