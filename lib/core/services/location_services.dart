import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  /// التأكد إن خدمة الموقع مفعلة
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  /// التأكد من صلاحيات الموقع وطلبها لو مش موجودة
  Future<LocationPermission> checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission;
  }

  /// التحقق من تفعيل الخدمة والصلاحية
  Future<bool> ensureLocationAccess() async {
    final isEnabled = await isLocationServiceEnabled();
    final permission = await checkPermission();

    return isEnabled &&
        (permission == LocationPermission.always ||
            permission == LocationPermission.whileInUse);
  }

  /// الحصول على الموقع الحالي
  Future<Position?> getCurrentLocation() async {
    final hasAccess = await ensureLocationAccess();
    if (!hasAccess) return null;

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  /// الحصول على الموقع باستمرار (Stream)
  Stream<Position> getLocationStream({
    LocationAccuracy accuracy = LocationAccuracy.best,
    int distanceFilter = 10,
  }) {
    return Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: accuracy,
        distanceFilter: distanceFilter,
      ),
    );
  }

  Future<String?> getPlaceNameFromPosition(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        return '${place.street}';
      }
    } catch (e) {
      return e.toString();
    }
    return null;
  }
}
