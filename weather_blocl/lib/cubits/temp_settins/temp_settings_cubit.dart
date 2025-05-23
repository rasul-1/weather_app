import 'package:bloc/bloc.dart';
part 'temp_settings_state.dart';

class TempSettingsCubit extends Cubit<TempSettingsState> {
  TempSettingsCubit() : super(TempSettingsState.initial());
  void toggleTempUnit() {
    emit(
      state.copyWith(
        tempUnit: state.tempUnit == TempUnit.celcius
            ? TempUnit.ferenhiet
            : TempUnit.celcius,
      ),
    );
    print("State: $state");
  }
}
