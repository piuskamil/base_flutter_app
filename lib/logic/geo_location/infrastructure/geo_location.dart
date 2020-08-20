import 'package:baseflutterapp/logic/core/domain/data_object.dart';
import 'package:baseflutterapp/logic/geo_location/domain/geo_location.dart';
import 'package:baseflutterapp/logic/geo_location/domain/geo_location_failures.dart';
import 'package:baseflutterapp/logic/geo_location/domain/location_lat_lng.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

@LazySingleton(as: GeoLocationImp)
class GeoLocation implements GeoLocationImp {
  @override
  Future<DataObject<GeoLocationFailure, LocationLatLng>> getLocation() async {
    final Location _location = Location();

    try {
      final LocationData _locationData = await _location.getLocation();

      return DataObject.data(LocationLatLng(
        lat: _locationData.latitude,
        long: _locationData.longitude,
      ));
    } catch (e) {
      return DataObject.failure(GeoLocationFailure());
    }
  }
}
