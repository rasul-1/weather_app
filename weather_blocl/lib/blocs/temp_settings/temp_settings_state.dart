part of 'temp_settings_bloc.dart';

enum TempUnit{
  celcius,
  ferenhiet,
}
class TempSettingsState {
  final TempUnit tempUnit;
  TempSettingsState({
     this.tempUnit=TempUnit.celcius,
  });
  factory TempSettingsState.initial(){
    return TempSettingsState();
  }

  @override
  bool operator ==(covariant TempSettingsState other) {
    if (identical(this, other)) return true;
  
    return 
      other.tempUnit == tempUnit;
  }

  @override
  int get hashCode => tempUnit.hashCode;

  @override
  String toString() => 'TempSettingsState(tempUnit: $tempUnit)';

  TempSettingsState copyWith({
    TempUnit? tempUnit,
  }) {
    return TempSettingsState(
      tempUnit: tempUnit ?? this.tempUnit,
    );
  }
}
