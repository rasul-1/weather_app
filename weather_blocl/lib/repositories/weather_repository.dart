// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:open_weather_cubit/exceptions/weather_exception.dart';
import 'package:open_weather_cubit/models/custom_error.dart';
import 'package:open_weather_cubit/models/diract_geocoding.dart';
import 'package:open_weather_cubit/models/weather.dart';
import 'package:open_weather_cubit/services/weather_api_services.dart';

class WeatherRepository {
  final WeatherApiServices weatherApiServices;
  WeatherRepository({
    required this.weatherApiServices,
  });

  Future<Weather> fetchWeather(String city) async {
    try {
      final DirectGeocoding diractGeocoding =
          await weatherApiServices.getDiractGeoCoding(city);
      print('diractGeocoding:$diractGeocoding');

      final Weather tempWeather =
          await weatherApiServices.getWeather(diractGeocoding);

      final Weather weather = tempWeather.copyWith(
        name: diractGeocoding.name,
        country: diractGeocoding.country
        );
        return weather;
    } on WeatherException catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
    
  }
}
