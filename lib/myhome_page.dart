// ignore_for_file: unused_local_variable, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_demo/main.dart';
import 'package:graphql_demo/model/launches_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GraphQL"),
        centerTitle: true,
      ),
      body: Query(
          options: QueryOptions(document: gql(LaunchesGraphQL)),
          builder: (QueryResult result, {fetchMore, refetch}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            } else if (result.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            // var response = result.data!['Launches'];
            Welcome launchList =
                welcomeFromJson(jsonDecode(result.data!['Launches']));

            print(launchList);
            return ListView.builder(
                itemCount: launchList.data?.launches?.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5)),
                          height: 50,
                          width: double.infinity,
                          child: const Text("data"))
                    ],
                  );
                });
          }),
    );
  }
}
