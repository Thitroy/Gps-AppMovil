import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  static const DONQUIJOTE = LatLng(-36.81738889658547, -73.02477464570254);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: DONQUIJOTE,
            zoom: 17,
          ),
        ),
      );
}
