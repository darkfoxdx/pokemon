class Algorithm {
  bool contains(String search, String target) {
    var pattern = RegExp(r"[^w]"); // Non-word character
    return target.replaceAll(pattern, '').contains(search.replaceAll(pattern, ''));
  }
}