import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:university_poc/models/country.dart';
import 'package:university_poc/widgets/university/university_list.dart';

class CountryList extends StatefulWidget {
  const CountryList({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _CountryListState();
  }
}

class _CountryListState extends State<CountryList> {
  late Future<List<Country>> futureCountryList;

  List<Country> countryList = [];
  List<Country> testList = [
    Country(
      name: 'United Kingdom',
      flagUrl: 'https://flagcdn.com/w320/gb.png',
    ),
    Country(
      name: 'United States',
      flagUrl: 'https://flagcdn.com/w320/us.png',
    ),
    Country(
      name: 'Canada',
      flagUrl: 'https://flagcdn.com/w320/ca.png',
    ),
    Country(
      name: 'Germany',
      flagUrl: 'https://flagcdn.com/w320/de.png',
    ),
    Country(
      name: 'France',
      flagUrl: 'https://flagcdn.com/w320/fr.png',
    ),
    Country(
      name: 'Spain',
      flagUrl: 'https://flagcdn.com/w320/es.png',
    ),
    Country(
      name: 'Russian Federation',
      flagUrl: 'https://flagcdn.com/w320/ru.png',
    ),
    Country(
      name: 'China',
      flagUrl: 'https://flagcdn.com/w320/cn.png',
    ),
    Country(
      name: 'Japan',
      flagUrl: 'https://flagcdn.com/w320/jp.png',
    ),
    Country(
      name: 'India',
      flagUrl: 'https://flagcdn.com/w320/in.png',
    ),
    Country(
      name: 'Australia',
      flagUrl: 'https://flagcdn.com/w320/au.png',
    ),
    Country(
      name: 'New Zealand',
      flagUrl: 'https://flagcdn.com/w320/nz.png',
    )
  ];

  @override
  void initState() {
    super.initState();
    countryList = testList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(
          widget.title,
          style: GoogleFonts.lato(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: countryList.length,
        itemBuilder: (ctx, index) => Card(
          child: ListTile(
            title: Row(children: [
              Image.network(
                countryList[index].flagUrl,
                scale: 3,
              ),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  countryList[index].name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]),
            onTap: () {
              Navigator.push(
                ctx,
                MaterialPageRoute(
                    builder: (ctx) =>
                        UniversityList(countryName: countryList[index].name)),
              );
            },
          ),
        ),
      ),
    );
  }
}
