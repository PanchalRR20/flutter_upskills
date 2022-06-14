// import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
//
// const productsGraphQL11 = """
// query products{
//  country
//   (code:"IN"){
//     name
//     code
//     phone
//     currency
//     continent{
//       name
//
//     }
//     languages{
//       name
//     }
//   }
//
// }
// """;
//
// const productsGraphQL = """
// query products {
// products(first: 10){
// edges{
// node{
// id
// name
// description
// }
// }
// }
// } """;
//
// void main() {
//   final HttpLink httpLink = HttpLink("https://countries.trevorblades.com/");
//   //final HttpLink httpLink = HttpLink("https://demo.saleor.io/graphql/");
//   ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
//       link: httpLink, cache: GraphQLCache(store: InMemoryStore())));
//   var app = GraphQLProvider(
//     client: client,
//     child: MyApp(),
//   );
//   runApp(app);
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const GraphQlWidget(),
//     );
//   }
// }
//
// class GraphQlWidget extends StatefulWidget {
//   const GraphQlWidget({Key? key}) : super(key: key);
//
//   @override
//   _GraphQlWidgetState createState() => _GraphQlWidgetState();
// }
//
// class _GraphQlWidgetState extends State<GraphQlWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Graph QL"),
//       ),
//       body: Query(
//         options: QueryOptions(document: gql(productsGraphQL11)),
//         builder: (QueryResult result, {fetchMore, refetch}) {
//           if (result.hasException) {
//             return Text("Error :: ${result.exception.toString()}");
//           }
//
//           if (result.isLoading) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//
//           //final productList = result.data?["products"];
//           final countryData = result.data?["country"];
//           print(countryData);
//           return Text(countryData.toString());
//         },
//       ),
//     );
//   }
// }
