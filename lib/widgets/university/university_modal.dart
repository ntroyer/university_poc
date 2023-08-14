import 'package:flutter/material.dart';

class UniversityModal extends StatelessWidget {
  const UniversityModal({
    super.key,
    required this.name,
    required this.webPages,
  });

  final String name;
  final List<String> webPages;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Websites for $name'),
        ...webPages.map((page) => Text(page)).toList(),
      ],
    );
  }
}
