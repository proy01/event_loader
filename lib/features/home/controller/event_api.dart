import 'dart:convert';

import 'package:tif_assignment/features/home/model/event_info.dart';
import 'package:http/http.dart' as http;

class EventApi {

  Future<List> _getEvents() async{
    var events = await http.read(Uri.https('sde-007.api.assignment.theinternetfolks.works', '/v1/event'));
    var decodedResponse = jsonDecode(events) as Map;
    return decodedResponse['content']['data'];
  }

  Future<List> getEventObjects() async{
    var events = await _getEvents();
    return List.generate(events.length, (index) => EventInfo.fromJSON(events[index]));

  }

  Future<List> _getSearch(String query) async {
    var events = await http.read(Uri.https('sde-007.api.assignment.theinternetfolks.works', '/v1/event', {'search' : query}));
    var decodedResponse = jsonDecode(events) as Map;
//     return List.generate(decodedResponse.length, (index) => EventInfo.fromJSON(decodedResponse['content']['data'][index]));
    return decodedResponse['content']['data'];
  }

  Future<List> getSearchObjects(String query) async{
    var events = await _getSearch(query);
    return List.generate(events.length, (index) => EventInfo.fromJSON(events[index]));

  }
}
