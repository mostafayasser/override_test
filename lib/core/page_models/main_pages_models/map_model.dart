import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../ui/shared/base_notifier.dart';

class MapModel extends BaseNotifier {
  static bool _infict = false;
  int _counter = 0;
  static final _green =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
  static final _red =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
  static final _yellow =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow);

  static LatLng _mark_1 = LatLng(40.744435, -74.190299);
  static LatLng _mark_2 = LatLng(40.742680, -74.191243);
  static LatLng _mark_3 = LatLng(40.741590, -74.191823);
  static LatLng _mark_4 = LatLng(40.742582, -74.191265);
  static LatLng _mark_5 = LatLng(40.744727, -74.190167);
  static LatLng _mark_6 = LatLng(40.745896, -74.189644);

  void move() {
    _counter++;
    if (_counter == 1) {
      _mark_3 = _mark_4;
    } else if (_counter == 2) {
      _mark_3 = _mark_5;
    } else if (_counter == 3) {
      _mark_3 = _mark_6;
    }
    notifyListeners();
  }

  void reset() {
    _infict = false;
    _counter = 0;
    _mark_3 = LatLng(40.741590, -74.191823);
    notifyListeners();
  }

  void infect() {
    _infict = true;

    notifyListeners();
  }

  List<Marker> getMarkers() {
    return [
      Marker(
          markerId: MarkerId('1'),
          icon: _infict ? _yellow : _green,
          draggable: true,
          infoWindow: InfoWindow(
            title: "Mohamad Ahmed",
            snippet: "Places: Nasr city , suez road and Masr elgdida ",
          ),
          position: _mark_1),
      Marker(
          markerId: MarkerId('2'),
          icon: _infict ? _yellow : _green,
          draggable: true,
          infoWindow: InfoWindow(
            title: "Mohamad Ahmed",
            snippet: "Places: Nasr city , suez road and Masr elgdida ",
          ),
          position: _mark_2),
      Marker(
          infoWindow: InfoWindow(
            title: "Mohamad Ahmed",
            snippet: "Places: Nasr city , suez road and Masr elgdida ",
          ),
          markerId: MarkerId('3'),
          icon: _infict ? _red : _green,
          draggable: true,
          position: _mark_3)
    ];
  }
}
