import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapHelper {
  static late GoogleMapController mapController;
  static final Set<Marker> markers = {};
  static const LatLng center = LatLng(15.57533264570, 32.54064005);

  //on map created
  static void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    // markers.clear();
    setInitialMarker();
  }

  //set markers
  static void setInitialMarker() {
    final marker = Marker(
      markerId: MarkerId('1'),
      position: center,
    );
    // markers['1'] = marker;
    markers.add(marker);
  }

  //add markers
  static void addNewMarkers(Marker marker) {
    markers.add(marker);
  }
}
