class ContinentsModel {
  ContinentsModel({
    this.data,
  });

  Data data;

  factory ContinentsModel.fromJson(Map<String, dynamic> json) =>
      ContinentsModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.continents,
  });

  List<Continent> continents;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        continents: List<Continent>.from(
            json["continents"].map((x) => Continent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "continents": List<dynamic>.from(continents.map((x) => x.toJson())),
      };
}

class Continent {
  Continent({
    this.code,
    this.name,
    this.countries,
  });

  String code;
  String name;
  List<Country> countries;

  factory Continent.fromJson(Map<String, dynamic> json) => Continent(
        code: json["code"],
        name: json["name"],
        countries: List<Country>.from(
            json["countries"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
      };
}

class Country {
  Country({
    this.code,
    this.name,
    this.phone,
    this.capital,
    this.currency,
    this.languages,
    this.states,
  });

  String code;
  String name;
  String phone;
  String capital;
  String currency;
  List<Language> languages;
  List<Language> states;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        code: json["code"],
        name: json["name"],
        phone: json["phone"],
        capital: json["capital"] == null ? null : json["capital"],
        currency: json["currency"] == null ? null : json["currency"],
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
        states: List<Language>.from(
            json["states"].map((x) => Language.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "phone": phone,
        "capital": capital == null ? null : capital,
        "currency": currency == null ? null : currency,
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
        "states": List<dynamic>.from(states.map((x) => x.toJson())),
      };
}

class Language {
  Language({
    this.name,
  });

  String name;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
