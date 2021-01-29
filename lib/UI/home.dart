import 'package:countries_graphql_tutorial/Models/continents_model.dart';
import 'package:countries_graphql_tutorial/UI/widgets/loader.dart';
import 'package:countries_graphql_tutorial/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'countries.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Data continentsModel = Provider.of<Data>(
      context,
    );
    if (continentsModel == null) return const Loading();
    List<Continent> continents = continentsModel.continents;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width,
                color: Color(0xff0D0D0D),
                child: Center(
                  child: Text('Continents and countries',
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontSize: 24, color: Colors.white)),
                ),
              ),
              SizedBox(height: 20.0),
              Column(
                children: continents.map((e) {
                  return ContinentCard(
                    title: e.name,
                    leading: e.code,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CountriesView(e.countries, e.name)));
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContinentCard extends StatelessWidget {
  final String title, leading;
  final VoidCallback onTap;

  const ContinentCard({
    Key key,
    this.title,
    this.leading,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            onTap: onTap,
            contentPadding: EdgeInsets.zero,
            title: Text(title),
            leading: CircleAvatar(
                radius: 50,
                backgroundColor: colorSwitch(title),
                child: Text(leading)),
            trailing: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
              onPressed: onTap,
            ),
          ),
        ),
      ),
    );
  }
}
