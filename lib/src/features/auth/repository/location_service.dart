import 'package:geocode/geocode.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as permit;

class LocationService {
  Location location = new Location();
  GeoCode geoCode = GeoCode();

  Future<List<geo.Placemark>> findAddress(double lat, double log) async {
    try {
      List<geo.Placemark> placemarks =
          await geo.placemarkFromCoordinates(lat, log);
      // final address =
      //     await geoCode.reverseGeocoding(latitude: lat, longitude: log);
      // print(address);
      // print(placemarks);
      return placemarks;
    } on GeocodeException catch (e) {
      print('error $e');
      return [];
    }
  }

  Future<bool> checkAndRequestPermission() async {
    if (!await location.serviceEnabled()) {
      // Location services are disabled.
      return false;
    }
    var locationPermission = await permit.Permission.location;

    // var locationPermission = await location.hasPermission();
    if (locationPermission == PermissionStatus.deniedForever) {
      // Cannot request runtime permission because location permission is denied forever.
      return false;
    } else if (locationPermission == PermissionStatus.denied) {
      // Ask the user for location permission.
      final request = await permit.Permission.location.request();
      // locationPermission = request.;
      if (request == PermissionStatus.denied ||
          request == PermissionStatus.deniedForever) return false;
    }
    return true;
  }

  Future<List<geo.Placemark>> getLocation() async {
    try {
      print('call');
      if (await checkAndRequestPermission()) {
        final value = await location.getLocation();
        print('value $value');
        return await findAddress(value.latitude!, value.longitude!);
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
