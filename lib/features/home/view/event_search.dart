import 'package:flutter/material.dart';
import 'package:tif_assignment/features/home/controller/event_api.dart';
import 'package:tif_assignment/features/home/view/event_card.dart';

class EventSearch extends SearchDelegate{

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: (){
      query = '';
    }, icon: const Icon(Icons.close))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: Navigator.of(context).pop,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: EventApi().getSearchObjects(query),
      builder: (context, snapshot){
        if (snapshot.connectionState != ConnectionState.done){
          return const Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(snapshot.data!.length, (index) {
                    return EventCard(
                        eventInfo: snapshot.data![index]);
                  })
                ],
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // throw UnimplementedError();
    if (query == null || query.isEmpty) {
      return Container();
    }
    return FutureBuilder(
      future: EventApi().getSearchObjects(query),
      builder: (context, snapshot){
        if (snapshot.connectionState != ConnectionState.done){
          return const Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(snapshot.data!.length, (index) {
                    return EventCard(
                        eventInfo: snapshot.data![index]);
                  })
                ],
              ),
            ),
          );
        }
      },
    );
  }
}