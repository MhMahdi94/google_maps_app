import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapHelper {
  static late GoogleMapController mapController;
  static final Set<Marker> markers = {};
  static const LatLng center = LatLng(15.57533264570, 32.54064005);

  //on map created
  static void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    // markers.clear();
    addCustomIcon();
    setInitialMarker();
  }

  //set markers
  static void setInitialMarker() {
    const marker = Marker(
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

  //add custom marker
  static BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  static void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/location.png")
        .then(
      (icon) {
        markerIcon = icon;
      },
    );
  }

  //draw polyline
  static Set<Polyline> polylines = {};

  static void addPolyline(LatLng loc1, LatLng loc2) {
    polylines.add(Polyline(
      polylineId: PolylineId(loc1.toString()),
      visible: true,
      width: 5, //width of polyline
      points: [
        loc1, //start point
        loc2, //end point
      ],
      color: Colors.deepPurpleAccent, //color of polyline
    ));
  }
}
