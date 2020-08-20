import 'package:baseflutterapp/logic/core/domain/const.dart';
import 'package:baseflutterapp/logic/geo_location/application/geo_location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import '../../../injection.dart';
import 'map_screen_presenter.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: TRANSPARENT_COLOR,
        centerTitle: true,
        title: Text(''),
      ),
      body: _MapScreen(),
    );
  }
}

class _MapScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends State<_MapScreen> with MapScreenView {
  final MapScreenPresenter _presenter = serviceLocator<MapScreenPresenter>();
  final MapController mapController = MapController();

  @override
  void initState() {
    super.initState();

    _presenter.onViewReady(this);
    _presenter.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            MaterialButton(
              child: Text('Warsaw'),
              onPressed: () {
                mapController.move(LatLng(52.2297, 21.0122), 10.0);
              },
            ),
            CurrentLocation(mapController: mapController),
          ],
        ),
        Row(
          children: [],
        ),
        Flexible(
          child: FlutterMap(
            mapController: mapController,
            options: MapOptions(
              center: LatLng(51.5, -0.09),
              zoom: 13.0,
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              MarkerLayerOptions(
                markers: [
                  new Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(51.5, -0.09),
                    builder: (ctx) => new Container(
                      child: new FlutterLogo(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({
    Key key,
    @required this.mapController,
  }) : super(key: key);

  final MapController mapController;

  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  var icon = Icons.gps_not_fixed;

  final GeoLocationService _geoLocationService = serviceLocator<GeoLocationService>();

  void _moveToCurrent() async {
    var currentLocation = await _geoLocationService.getLocation();

    if (currentLocation.isFailure()) {
      setState(() {
        icon = Icons.gps_off;
      });
      return;
    }

    widget.mapController.move(
      LatLng(currentLocation.data.lat, currentLocation.data.long),
      18,
    );

    setState(() {
      icon = Icons.gps_fixed;
    });
    await widget.mapController.position.first;
    setState(() {
      icon = Icons.gps_not_fixed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: _moveToCurrent,
    );
  }
}
