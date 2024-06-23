import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geocoding/geocoding.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({super.key});

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  static const UBBGloriosa = LatLng(-36.822320815816, -73.01327110291612);
  final TextEditingController _searchController = TextEditingController();
  final Completer<GoogleMapController> _mapController = Completer();
  LatLng _currentPosition = UBBGloriosa;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _goToLocation(LatLng position) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: position, zoom: 15),
    ));
    setState(() {
      _currentPosition = position;
    });
  }

  Future<List<String>> _getSuggestions(String query) async {
    List<Location> locations = await locationFromAddress(query);
    return locations.map((location) => '${location.latitude}, ${location.longitude}').toList();
  }

  Future<void> _searchLocation(String query) async {
    List<Location> locations = await locationFromAddress(query);
    if (locations.isNotEmpty) {
      LatLng position = LatLng(locations.first.latitude, locations.first.longitude);
      _goToLocation(position);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('UBBícame APP'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Busca el lugar',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                suggestionsCallback: _getSuggestions,
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text(suggestion),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  _searchLocation(suggestion);
                },
              ),
            ),
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: UBBGloriosa,
                  zoom: 15,
                ),
                onMapCreated: (controller) => _mapController.complete(controller),
                markers: {
                  const Marker(
                    markerId: MarkerId("Universidad del Bío-Bío"),
                    position: LatLng(-36.82235516944244, -73.01327110380315),
                    infoWindow: InfoWindow(
                      title: "UBB",
                      snippet: "En Paro",
                    ),
                  ),
                
                },
              ),
            ),
          ],
        ),
      );
}
