import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Websites for $name',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...webPages
              .map((page) => SelectableText(
                    page,
                    style: GoogleFonts.lato(),
                    onTap: () {
                      launchUrl(Uri.parse(page));
                    },
                  ))
              .toList(),
        ],
      ),
    );
  }
}
