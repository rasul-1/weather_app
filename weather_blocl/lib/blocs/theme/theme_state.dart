part of 'theme_bloc.dart';

enum AppTheme{
  light,
  dark
}
class ThemeState {
  final AppTheme appTheme;
  ThemeState({
     this.appTheme=AppTheme.light,
  });
  factory ThemeState.initial(){
    return ThemeState();
  }

  @override
  bool operator ==(covariant ThemeState other) {
    if (identical(this, other)) return true;
  
    return 
      other.appTheme == appTheme;
  }

  @override
  int get hashCode => appTheme.hashCode;

  @override
  String toString() => 'ThemeState(appTheme: $appTheme)';

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }
}
