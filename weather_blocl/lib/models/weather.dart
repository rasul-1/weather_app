// ignore_for_file: public_member_api_docs, sort_constructors_first
class Weather {
  final String description;
  final String icon;
  final double temp;
  final double tempmin;
  final double tempmax;
  final String name;
  final String country;
  final DateTime lastUpdated;
  Weather({
    required this.description,
    required this.icon,
    required this.temp,
    required this.tempmin,
    required this.tempmax,
    required this.name,
    required this.country,
    required this.lastUpdated,
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final main = json['main'];

    return Weather(
      description: weather['description'],
      icon: weather['icon'],
      temp: main['temp'],
      tempmin: main['temp_min'],
      tempmax: main['temp_max'],
      name: '',
      country: '',
      lastUpdated: DateTime.now(),
    );
  }
  factory Weather.initial() => Weather(
        description: " ",
        icon: '',
        temp: 100.0,
        tempmin: 100.0,
        tempmax: 100.0,
        name: "",
        country: "",
        lastUpdated: DateTime(1970),
      );

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.description == description &&
        other.icon == icon &&
        other.temp == temp &&
        other.tempmin == tempmin &&
        other.tempmax == tempmax &&
        other.name == name &&
        other.country == country &&
        other.lastUpdated == lastUpdated;
  }

  @override
  int get hashCode {
    return description.hashCode ^
        icon.hashCode ^
        temp.hashCode ^
        tempmin.hashCode ^
        tempmax.hashCode ^
        name.hashCode ^
        country.hashCode ^
        lastUpdated.hashCode;
  }

  @override
  String toString() {
    return 'Weather(description: $description, icon: $icon, temp: $temp, tempmin: $tempmin, tempmax: $tempmax, name: $name, country: $country, lastUpdated: $lastUpdated)';
  }

  Weather copyWith({
    String? description,
    String? icon,
    double? temp,
    double? tempmin,
    double? tempmax,
    String? name,
    String? country,
    DateTime? lastUpdated,
  }) {
    return Weather(
      description: description ?? this.description,
      icon: icon ?? this.icon,
      temp: temp ?? this.temp,
      tempmin: tempmin ?? this.tempmin,
      tempmax: tempmax ?? this.tempmax,
      name: name ?? this.name,
      country: country ?? this.country,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
