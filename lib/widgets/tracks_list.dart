import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/models/current_track_model.dart';
import 'package:flutter_spotify_ui/models/models.dart';
import 'package:provider/provider.dart';

class TracksList extends StatelessWidget {
  final List<Song> tracks;

  const TracksList({
    Key? key,
    required this.tracks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      showCheckboxColumn: false,
      dataRowHeight: 54.0,
      headingTextStyle:
          Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
      columns: [
        DataColumn(label: Text('TITLE')),
        DataColumn(label: Text('ARTIST')),
        DataColumn(label: Text('ALBUM')),
        DataColumn(label: Icon(Icons.access_time)),
      ],
      rows: tracks.map(
        (e) {
          final selected =
              context.watch<CurrentTrackModel>().selected?.id == e.id;
          final textStyle = TextStyle(
              color: selected
                  // ignore: deprecated_member_use
                  ? Theme.of(context).accentColor
                  : Theme.of(context).iconTheme.color);
          return DataRow(
            selected: selected,
            onSelectChanged: (_) =>
                context.read<CurrentTrackModel>().selectTrack(e),
            cells: [
              DataCell(
                Text(
                  e.title,
                  style: textStyle,
                ),
              ),
              DataCell(
                Text(
                  e.artist,
                  style: textStyle,
                ),
              ),
              DataCell(
                Text(
                  e.album,
                  style: textStyle,
                ),
              ),
              DataCell(
                Text(
                  e.duration,
                  style: textStyle,
                ),
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}
