import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tif_assignment/features/home/model/event_info.dart';
import 'package:tif_assignment/features/home/view/cutom_appbar.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({Key? key}) : super(key: key);

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  bool bookmarked = false;

  @override
  Widget build(BuildContext context) {
    final eventInfo = ModalRoute.of(context)!.settings.arguments as EventInfo;

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(image: eventInfo.bannerImage, context: context,),
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 20),
                      child: Text(
                        eventInfo.title,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 52,
                          width: 55,
                          color: Colors.transparent,
                          child: Image.network(eventInfo.orgIcon,fit: BoxFit.cover,
                            loadingBuilder:(BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null ?
                                  loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 16,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              eventInfo.orgName,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 12,),
                            Text(
                              'Organizer',
                              style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 24,),
                    Row(
                      children: [
                        Container(
                          height: 52,
                          width: 55,
                          decoration: BoxDecoration(
                              color: const Color(0xFF5669FF).withOpacity(0.12),
                              borderRadius: const BorderRadius.all(Radius.circular(12))
                          ),
                          child: const Icon(
                            Icons.calendar_month_outlined,
                            size: 25,
                            color: Color(0xFF5669FF),
                          ),
                        ),
                        const SizedBox(width: 16,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('d MMMM, y').format(eventInfo.dateTime),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 12,),
                            Text(
                              DateFormat('EEEE,').add_jm().format(eventInfo.dateTime),
                              style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 24,),
                    Row(
                      children: [
                        Container(
                          height: 52,
                          width: 55,
                          decoration: BoxDecoration(
                            color: const Color(0xFF5669FF).withOpacity(0.12),
                            borderRadius: const BorderRadius.all(Radius.circular(12))
                          ),
                          child: const Icon(
                            Icons.pin_drop_rounded,
                            size: 25,
                            color: Color(0xFF5669FF)
                          ),
                        ),
                        const SizedBox(width: 16,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                eventInfo.venueName,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 12,),
                              Text(
                                '${eventInfo.venueCity}, ${eventInfo.venueCountry}',
                                style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 24,),
                    Text(
                      'About Event',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 18,),
                    Text(
                      eventInfo.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 100,),
                  ],
          ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                    Colors.white.withOpacity(1),
                    Colors.white.withOpacity(0.6),
                    Colors.white.withOpacity(0.2),
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter,
                  ),

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Container(
                            width: 227,
                            height: 58,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('Book Now'),
                                  SizedBox(width: 45,),
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(100)),
                                      color: Color(0xFF3D56F0),

                                    ),
                                    child: Icon(
                                      Icons.arrow_right_alt,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
