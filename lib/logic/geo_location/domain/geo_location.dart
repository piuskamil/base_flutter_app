import 'package:baseflutterapp/logic/core/domain/data_object.dart';

import 'geo_location_failures.dart';
import 'location_lat_lng.dart';

abstract class GeoLocationImp {
  Future<DataObject<GeoLocationFailure, LocationLatLng>> getLocation();
}