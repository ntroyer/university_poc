import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:university_poc/models/university.dart';
import 'package:university_poc/widgets/university/university_modal.dart';

class UniversityList extends StatefulWidget {
  const UniversityList({
    super.key,
    required this.countryName,
  });

  final String countryName;

  @override
  State<StatefulWidget> createState() {
    return _UniversityListState();
  }
}

class _UniversityListState extends State<UniversityList> {
  List<University> universityList = [];
  List<University> testList = [
    University(
        name: 'Royal Holloway University of London',
        webPages: ['https://myport.port.ac.uk'])
  ];

  Future<List<University>> fetchUniversities() async {
    String url =
        'http://universities.hipolabs.com/search?country=${widget.countryName}';
    return await http.get(Uri.parse(url)).then((response) {
      final res = jsonDecode(response.body);
      List<University> uniList = [];

      for (var r in res) {
        University uni = University.fromJson(r);
        uniList.add(uni);
      }

      return uniList;
    });
  }

  @override
  void initState() {
    super.initState();
    /*showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(children: [
            const CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
            Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text('Fetching universities...'),
            )
          ]),
        );
      }
    );*/
    fetchUniversities().then((unis) {
      // Navigator.pop(context);
      setState(() {
        universityList = unis;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.countryName} Universities'),
      ),
      body: ListView.builder(
        itemCount: universityList.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(universityList[index].name),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (ctx) => UniversityModal(
                name: universityList[index].name,
                webPages: universityList[index].webPages,
              ),
            );
          },
        ),
      ),
    );
  }
}