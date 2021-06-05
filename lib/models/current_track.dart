import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class CurrentTrack extends ChangeNotifier {
  Song? selected;

  void selectTrack(Song track) {
    selected = track;
    notifyListeners();
  }
}
