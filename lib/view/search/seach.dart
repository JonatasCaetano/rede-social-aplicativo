import 'package:flutter/material.dart';
import 'package:social_network_application/scoped_model/auxiliar/database_model.dart';
import 'package:social_network_application/view/search/result_search.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ResultSearch(
      query: query,
      result: true,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<Set<String>>(
          future: DatabaseModel().getByNameSuggestions(query),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Container();
              default:
                if (!snapshot.hasData) {
                  return Container();
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultSearch(
                                            query:
                                                snapshot.data!.toList()[index],
                                            result: false,
                                          )));
                            },
                            child: ListTile(
                              title: Row(
                                children: [
                                  const Icon(Icons.search),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  SizedBox(
                                    width: 200.0,
                                    child: Text(
                                      snapshot.data!.toList()[index],
                                      overflow: TextOverflow.fade,
                                      maxLines: 1,
                                      softWrap: false,
                                    ),
                                  )
                                ],
                              ),
                            ));
                      });
                }
            }
          }),
    );
  }
}
