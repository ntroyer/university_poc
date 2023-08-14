import 'package:flutter/material.dart';

import 'package:university_poc/widgets/country_list.dart';

void main() {
  runApp(const UnisByCountry());
}

class UnisByCountry extends StatelessWidget {
  const UnisByCountry({super.key});

  final String title = 'Universities by Country';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CountryList(title: title),
    );
  }
}
