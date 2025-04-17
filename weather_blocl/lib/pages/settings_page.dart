import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather_cubit/blocs/blocs.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SEttings'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: ListTile(
          title: Text('Tempreture unit'),
          subtitle: Text('Celcius or Ferenhiet (Default: Celcius)'),
          trailing: Switch(
            value: context.watch<TempSettingsBloc>().state.tempUnit==TempUnit.celcius,
            onChanged: (_) {
              context.read<TempSettingsBloc>().add(ToggleTempUnitEvent());
            },
          ),
        ),
      ),
    );
  }
}
