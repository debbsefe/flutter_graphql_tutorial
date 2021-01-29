import 'dart:math';

import 'package:countries_graphql_tutorial/Models/continents_model.dart';
import 'package:countries_graphql_tutorial/Utils/utils.dart';
import 'package:flutter/material.dart';

class CountriesView extends StatefulWidget {
  final List<Country> countries;
  final String continent;
  CountriesView(this.countries, this.continent);

  @override
  _CountriesViewState createState() => _CountriesViewState();
}

class _CountriesViewState extends State<CountriesView> {
  List<Country> countries;

  @override
  void initState() {
    super.initState();
    countries = widget.countries;
  }

  List<Country> searchPage(String value) {
    var countries = widget.countries
        .where(
          (element) => element.name.toLowerCase().contains(value.toLowerCase()),
        )
        .toList();
    return countries;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                color: colorSwitch(widget.continent),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: colortextSwitch(widget.continent),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Text('Countries in ${widget.continent}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24,
                                color: colortextSwitch(widget.continent))),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      margin: const EdgeInsets.only(top: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (String val) {
                          List<Country> result = searchPage(val);
                          setState(() {
                            countries = result;
                          });
                        },
                        decoration: searchInputDecoration.copyWith(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Column(
                  children: [
                    Text('Showing ${countries.length} countries',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                      children: countries.map((e) {
                    return CountriesCard(
                        title: e.name,
                        leading: e.code,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Container(
                                    height: 100,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              'Capital: ${e.capital ?? 'N/A'}'),
                                          SizedBox(height: 10),
                                          Text(
                                              'Phone code: ${e.phone ?? 'N/A'}'),
                                          SizedBox(height: 10),
                                          Text(
                                              'Currency: ${e.currency ?? 'N/A'}'),
                                          SizedBox(height: 10),
                                          Text('Languages:'),
                                          for (var lang in e.languages)
                                            Text(lang.name),
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Cancel',
                                          style:
                                              TextStyle(color: Colors.green)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        });
                  }).toList()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CountriesCard extends StatelessWidget {
  final String title, leading;
  final VoidCallback onTap;

  const CountriesCard({Key key, this.title, this.leading, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        elevation: 3,
        shadowColor: Color(0xffDFDCD6),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            onTap: onTap,
            contentPadding: EdgeInsets.zero,
            title: Text(title),
            leading: CircleAvatar(
                radius: 50,
                backgroundColor:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                child: Text(leading)),
          ),
        ),
      ),
    );
  }
}

const searchInputDecoration = InputDecoration(
  isDense: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  ),
  fillColor: Colors.white,
  filled: true,
);
