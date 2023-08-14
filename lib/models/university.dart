class University {
  String name;
  List<String> webPages;

  University({
    required this.name,
    required this.webPages,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      name: json['name'],
      webPages: List<String>.from(json['web_pages'] as List),
    );
  }
}
