import 'package:baseflutterapp/logic/core/domain/data_object.dart';
import 'package:baseflutterapp/logic/geo_location/domain/geo_location.dart';
import 'package:baseflutterapp/logic/geo_location/domain/geo_location_failures.dart';
import 'package:baseflutterapp/logic/geo_location/domain/location_lat_lng.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GeoLocationService {
  final GeoLocationImp _geoLocationImp;

  GeoLocationService(this._geoLocationImp);

  Future<DataObject<GeoLocationFailure, LocationLatLng>> getLocation() {
    return _geoLocationImp.getLocation();
  }
}
