import 'package:flutter/material.dart';
import 'package:tif_assignment/features/home/view/event_search.dart';

import '../controller/event_api.dart';
import 'event_card.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              widget.title,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  showSearch(context: context, delegate: EventSearch());
                                },
                                icon: const Icon(
                                  Icons.search,
                                  size: 28,
                                ),
                                color: Theme.of(context).iconTheme.color,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.more_vert,
                                  size: 28,
                                ),
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: FutureBuilder(
                      future: EventApi().getEventObjects(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(snapshot.data!.length, (index) {
                                return EventCard(
                                    eventInfo: snapshot.data![index]);
                              })
                            ]);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
