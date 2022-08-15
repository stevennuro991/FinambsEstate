import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:estate/components/location_components.dart';
import 'package:estate/utils/colorscheme.dart';

class Location extends StatefulWidget {
  const Location({Key key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final Set<Marker> _markers = {};
  static const LatLng _center = LatLng(21.0468981065856, 105.78542383913674);
  final LatLng _lastMapPosition = _center;

  GoogleMapController _controller;

  @override
  void initState() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          icon: BitmapDescriptor.defaultMarker));
      _markers.add(Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: const LatLng(21.0468981065856, 105.78542383913674),
          icon: BitmapDescriptor.defaultMarker));
      _markers.add(Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: const LatLng(21.043043806625505, 105.78156462614497),
          icon: BitmapDescriptor.defaultMarker));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                  zoomGesturesEnabled: true,
                  markers: _markers,
                  initialCameraPosition:
                      const CameraPosition(target: _center, zoom: 11.0),
                  mapType: MapType.normal,
                  onMapCreated: (controller) {
                    setState(() {
                      _controller = controller;
                    });
                  },
                  onTap: (coordinates) => _controller
                      .animateCamera(CameraUpdate.newLatLng(coordinates))),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const CircleAvatar(
                          maxRadius: 25,
                          backgroundColor: Colors.white,
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.only(
                            left: 8.0,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: primaryColor),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: TextField(
                            autocorrect: false,
                            cursorColor: primaryColor,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 16.0),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: primaryColor,
                              ),
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'Filters');
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 12.0, top: 12.0, bottom: 12.0),
                                    child: SvgPicture.asset(
                                      'assets/icons/filter.svg',
                                      height: 20,
                                      width: 20,
                                      color: primaryColor,
                                    ),
                                  )),
                              hintText: 'Tìm kiếm',
                              hintStyle: const TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: const Color(0xfff5f6f6),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30.0)),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    const Radius.circular(30.0)),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: 160,
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: listOfLocations()))
          ],
        ),
      ),
    );
  }
}
