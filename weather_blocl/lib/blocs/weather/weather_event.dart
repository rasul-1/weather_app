// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}
class FetchWeatherEvent extends WeatherEvent {
  final String city;
  FetchWeatherEvent({
    required this.city,
  });
}
