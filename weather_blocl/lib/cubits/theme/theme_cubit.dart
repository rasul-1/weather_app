import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather_cubit/constants/constants.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  
  ThemeCubit() : super(ThemeState.initial());
   void Setthemes(double currenetTemp){
      if (currenetTemp>kWarmorNot) {
        emit(state.copyWith(appTheme: AppTheme.light));
      }else{
        emit(state.copyWith(appTheme: AppTheme.dark));
      }
    } 
 
}
