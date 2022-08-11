import 'package:digimanage/screens/creating_announcement/new_announcement.dart';
import 'package:flutter/material.dart';

import '../CreatingMeeting/new_meeting.dart';

const createMenueList = [
  {"title":"Schedule a meeting","icon":Icons.people,"route":NewMeeting()},
  {"title":"Take a poll","icon":Icons.poll,"route":NewMeeting()},
  {"title":"Assign tasks","icon":Icons.task_alt_outlined,"route":NewMeeting()},
  {"title":"Make an announcement","icon":Icons.volume_down,"route":NewAnnouncement()},
];