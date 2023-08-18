import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

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
    return AlertDialog(
      title: Text(
        'Websites for $name',
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
        ...webPages.map((page) => SelectableText(
          page,
          style: GoogleFonts.lato(),
          onTap: () {
            FlutterWebBrowser.openWebPage(url: page);
          },
        )).toList(),
      ]),
    );
  }
}
