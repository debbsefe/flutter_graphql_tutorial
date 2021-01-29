class AllQueries {
  String continentsQuery() {
    return """
    query Continent{
  continents{
    code
    name
    countries{
      code
      name
      phone
      capital
      currency
       languages{
      name
    }
       states{
      name
    }
    }
  }
}
    """;
  }
}
