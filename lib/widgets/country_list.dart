import 'package:flutter/material.dart';

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
    )
  ];

  @override
  void initState() {
    super.initState();
    /*fetchCountryList().then((value) {
      setState(() {
        countryList = value;
      });
    });*/
    countryList = testList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: countryList.length,
        itemBuilder: (ctx, index) => Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: ListTile(
              title: Row(children: [
                Text(countryList[index].name),
                const Spacer(),
                Image.network(countryList[index].flagUrl),
              ]),
              onTap: () {
                Navigator.push(
                  ctx,
                  MaterialPageRoute(builder: (ctx) => UniversityList(countryName: countryList[index].name)),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
