import 'package:bloc/bloc.dart';
import 'package:open_weather_cubit/models/custom_error.dart';
import 'package:open_weather_cubit/models/weather.dart';
import 'package:open_weather_cubit/repositories/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit({required this.weatherRepository})
      : super(WeatherState.initial());

  Future<void> fetchWeather(String city) async {
    emit(state.copyWith(status: WeatherStatus.loading));

    try {
      final Weather weather =await weatherRepository.fetchWeather(city);

      emit(state.copyWith(
        status: WeatherStatus.loaded,
        weather: weather,
      ));
      print('State; $state');
    } on CustomError catch (e) {
      emit(state.copyWith(
        status: WeatherStatus.error,
        error: e,
      ));
      print('State; $state');
    }
  }
}
