/// A calculator that adds numbers from a string input.
class StringCalculator {
  /// Adds numbers in the given string and returns the sum.
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    var delimiters = [','];
    var numString = numbers;

    if (numbers.startsWith('//')) {
      var newlineIndex = numbers.indexOf('\n');
      var delimiterPart = numbers.substring(2, newlineIndex);
      numString = numbers.substring(newlineIndex + 1);

      if (delimiterPart.startsWith('[')) {
        var regex = RegExp(r'\[([^\]]+)\]');
        delimiters = regex
            .allMatches(delimiterPart)
            .map((m) => m.group(1)!)
            .toList();
      } else {
        delimiters = [delimiterPart];
      }
    }
    var normalized = numString.replaceAll('\n', delimiters.first);
    for (var d in delimiters.skip(1)) {
      normalized = normalized.replaceAll(d, delimiters.first);
    }
    var parts = normalized.split(delimiters.first);
    return parts.map((p) => int.parse(p)).fold(0, (a, b) => a + b);
  }
}
