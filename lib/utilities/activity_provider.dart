import 'package:flutter/material.dart';

class ActivityProvider with ChangeNotifier {
  var _activities = <Map>[];

  get activities => _activities;
  setActivity(Map activity) {
    _activities = [..._activities, activity];
    notifyListeners();
  }

  setActivities(List<Map> activities, String id) {
    activities.removeAt(int.parse(id));
    _activities = [...activities];
  }
}
