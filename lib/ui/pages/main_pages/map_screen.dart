import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/page_models/main_pages_models/map_model.dart';
import '../../shared/base_widget.dart';

//AIzaSyAYsl5mcNYX_aulajNTMZgAnz0cnxR_4r0

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      model: MapModel(),
      builder: (context, model, child) => SafeArea(
          child: Scaffold(
        body: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(40.744435, -74.190299), zoom: 12.0),
          markers: Set.from(model.getMarkers()),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FloatingActionButton(
              heroTag: null,
              onPressed: model.reset,
              child: Text('Reset'),
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: model.infect,
              child: Text('Infect'),
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: model.move,
              child: Text('Move'),
            ),
          ],
        ),
      )),
    );
  }
}
