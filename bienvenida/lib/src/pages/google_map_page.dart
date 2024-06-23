import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  static const UBBGloriosa = LatLng(-36.822320815816, -73.01327110291612);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: UBBGloriosa,
            zoom: 13,
          ),
        ),
      );
}
