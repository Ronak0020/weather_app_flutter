import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/api/weatherApi.dart';
import 'package:weather_app/model/weather_data.dart';

class GlobalController extends GetxController {
  final RxBool _loading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxString _cityName = "".obs;

  RxBool loading() => _loading;
  RxDouble latitude() => _latitude;
  RxDouble longitude() => _longitude;
  RxString cityName() => _cityName;

  final weatherData = WeatherData().obs;

  @override
  void onInit() {
    if (_loading.isTrue) getLocation();
    super.onInit();
  }

  getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    if (!serviceEnabled) {
      return Get.snackbar("Location Error!",
          "Location services are not enabled. Please turn on the location.");
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("Location Error!",
            "You have denied the location access for the app. Unable to fetch location for the weather.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("Location Error!",
          "Location permissions have been permanently denied. Please enable them for the app from the app settings page and try again!");
    }
    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _latitude.value = currentPosition.latitude;
    _longitude.value = currentPosition.longitude;
    await getCityName();

    weatherData.value = await API().fetchData(cityName().value);
    _loading.value = false;
  }

  getCityName() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(_latitude.value, _longitude.value);
    _cityName.value = placemarks[0].locality ?? "Unknown";
  }
}
