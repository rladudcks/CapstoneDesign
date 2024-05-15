import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

// String selectedTitle = 'Location Map Test';

class LocationMap extends StatefulWidget {
  const LocationMap({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<LocationMap> createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  late KakaoMapController mapController;

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       //title: Text(widget.title ?? selectedTitle),
  //       title: Text('Location Map Test'),
  //     ),
  //     body: KakaoMap(
  //       onMapTap: (latLng) {
  //         debugPrint('***** [JHC_DEBUG] ${latLng.toString()}');
  //       },
  //     ),
  //   );
  // }

  Set<Marker> markers = {}; // 마커 변수

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마커 표시하기'),
      ),
      body: KakaoMap(
        onMapCreated: ((controller) async {
          mapController = controller;

          markers.add(Marker(
            markerId: UniqueKey().toString(),
            latLng: await mapController.getCenter(),
          ));

          setState(() {});
        }),
        markers: markers.toList(),
        center: LatLng(37.3608681, 127.9306506),
      ),
    );
  }
}
