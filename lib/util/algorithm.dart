class Algorithm {
  static bool contains(String search, String target) {
    var pattern = RegExp(r'[^\w]'); // Non-word character
    var contains = target.toLowerCase().contains(search.toLowerCase());
    var containsWithoutSpecialCharacter = target
        .toLowerCase()
        .replaceAll(pattern, '')
        .contains(search.toLowerCase().replaceAll(pattern, ''));
    return contains || containsWithoutSpecialCharacter;
  }
}
