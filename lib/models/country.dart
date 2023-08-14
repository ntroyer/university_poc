class Country {
  String name;
  String flagUrl;

  Country({
    required this.name,
    required this.flagUrl,
  });

  /*factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'] ?? '',
      flagUrl: json['flagUrl'] ?? '',
    );
  }*/
}
