import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/event_info.dart';

class EventCard extends StatelessWidget {
  EventCard({Key? key, required this.eventInfo}) : super(key: key);

  EventInfo eventInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/details', arguments: eventInfo);
        },
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 5,
          color: Colors.white,
          shadowColor: Color(0xFF575C8A).withOpacity(0.6),
          child: Row(
            children: [
              _CardImage(image: eventInfo.bannerImage,),
              SizedBox(width: 8,),
              _CardContent(eventInfo: eventInfo,),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      child:ClipRRect(
        borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 92,
        width: 79,
        child: Image.network(image,fit: BoxFit.cover,
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
      ),
    );
  }
}

class _CardContent extends StatelessWidget {
  const _CardContent({Key? key, required this.eventInfo}) : super(key: key);

  final EventInfo eventInfo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat('E, MMM d •').add_jm().format(eventInfo.dateTime), style: Theme.of(context).textTheme.labelMedium,),
            Text(eventInfo.title, style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 20,),
            Row(
              children: [
                const Icon(Icons.pin_drop, color: Color(0xFFB0B1BC), size: 20,),
                Expanded(child: Text(' ${eventInfo.venueName}', style: Theme.of(context).textTheme.labelSmall,)),
              ],
            )
          ],
        ),
      ),
    );
  }
}


