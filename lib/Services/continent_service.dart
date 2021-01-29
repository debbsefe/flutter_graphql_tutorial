import 'package:countries_graphql_tutorial/Models/continents_model.dart';
import 'package:countries_graphql_tutorial/Queries/queries.dart';
import 'package:countries_graphql_tutorial/config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ApiService {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  AllQueries allQueries = AllQueries();

  Future<Data> getContinents() async {
    try {
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result = await _client
          .query(QueryOptions(documentNode: gql(allQueries.continentsQuery())));
      if (result.hasException) {
        print(result.exception.toString());
        return null;
      }
      var response = result.data.data;
      final map = response as Map<String, dynamic>;
      Data mappedResult = Data.fromJson(map);
      return mappedResult;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
