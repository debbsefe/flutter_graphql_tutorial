import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfiguration {
  GraphQLConfiguration();

  static HttpLink httpLink = HttpLink(
    uri: "https://countries.trevorblades.com/",
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: httpLink,
    );
  }
}
