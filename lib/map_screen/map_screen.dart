import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_maps_app/map_helper/map_helper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              LatLng loc1 = LatLng(15.57533264570, 32.54064005);
              LatLng loc2 = LatLng(15.568705930182675, 32.5516263861084);
              LatLng loc3 = LatLng(15.561955659333242, 32.55315050781248);
              MapHelper.addNewMarkers(
                Marker(
                  markerId: const MarkerId('2'),
                  draggable: true,
                  position: const LatLng(15.568705930182675, 32.5516263861084),
                  infoWindow: const InfoWindow(
                    title: 'New Marker',
                    snippet: 'Added',
                  ),
                  icon: MapHelper.markerIcon,
                ),
              );
              MapHelper.addNewMarkers(
                Marker(
                  markerId: const MarkerId('3'),
                  draggable: true,
                  position:
                      loc3, //LatLng(15.568705930182675, 32.5516263861084),
                  infoWindow: const InfoWindow(
                    title: 'New Marker',
                    snippet: 'Added',
                  ),
                  icon: MapHelper.markerIcon,
                ),
              );
              MapHelper.addPolyline(loc1, loc2);
              MapHelper.addPolyline(loc2, loc3);
              MapHelper.addPolyline(loc3, loc1);
              setState(() {});
            },
            child: const Text(
              'Add Location',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          MapHelper.onMapCreated(controller);
          setState(() {});
        },
        initialCameraPosition: const CameraPosition(
          target: MapHelper.center,
          zoom: 14,
        ),
        markers: MapHelper.markers,
        polylines: MapHelper.polylines,
      ),
    );
  }
}
