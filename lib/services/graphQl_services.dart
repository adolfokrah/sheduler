import 'package:graphql/client.dart';

class GraphQLServices{

  GraphQLClient initGraphQLClient(token) {

    //initialize a graphQl client
    final _httpLink = HttpLink("https://klarmd.herokuapp.com/graphql");
    Link _link;

    if(token != null){
      final _authLink = AuthLink(
        getToken: () async => 'Bearer $token',
      );
      _link = _authLink.concat(_httpLink);
    }else{
      _link = _httpLink;
    }

    return GraphQLClient(
      cache: GraphQLCache(),
      link: _link
    );
  }

  //send graphQl queries
  Future query(String query,[token,data])async{
      try{
        final GraphQLClient _client = initGraphQLClient(token);

        final QueryOptions options;

        if(data != null){
          options  = QueryOptions(document: gql(query),variables: data);
        }else{
          options = QueryOptions(document: gql(query));
        }


        final QueryResult result = await _client.query(options);

        return result;
      }catch(e){
         throw e;
      }
  }

  //send graphQL mutations
  Future mutation(String query, dynamic data, [token])async{
    final GraphQLClient _client = initGraphQLClient(token);

    final MutationOptions options = MutationOptions(document: gql(query), variables: data);


    final QueryResult result = await _client.mutate(options);
    if(result.hasException){
      throw "failed";
    }
    return result;

  }
}