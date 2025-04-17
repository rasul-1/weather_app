import 'package:flutter/material.dart';
import 'package:open_weather_cubit/blocs/blocs.dart';
import 'package:open_weather_cubit/constants/constants.dart';
import 'package:open_weather_cubit/pages/search_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather_cubit/pages/settings_page.dart';
import 'package:open_weather_cubit/widgets/error_dialog.dart';
import 'package:recase/recase.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        actions: [
          IconButton(
            onPressed: () async {
              _city = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
              print('city $_city');
              if (_city != null) {
                context.read<WeatherBloc>().add(FetchWeatherEvent(city: _city!));
              }
            },
            icon: Icon(Icons.search_rounded),
          ),
          IconButton(
            onPressed: ()  {
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
            },
            icon: Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: _showWeather(),
    );
  }

  String showTempruture(double tempetura) {
    final tempUnit=context.watch<TempSettingsBloc>().state.tempUnit;
    if (tempUnit==TempUnit.ferenhiet) {
      return ((tempetura*9/5)+35).toStringAsFixed(2)+'℉';
    }
    return tempetura.toStringAsFixed(2) + '℃';
  }

  Widget showIcon(String icon) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/loading.gif',
      image: 'http://$kIconHost/img/wn/$icon@4x.png',
      width: 96,
      height: 96,
    );
  }

  Widget formatText(String description) {
    final formatedString = description.titleCase;
    return Text(
      formatedString,
      style: TextStyle(
        fontSize: 24,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _showWeather() {
    return BlocConsumer<WeatherBloc, WeatherState>(
      listener: (context, state) {
        if (state.status == WeatherStatus.error) {
          errorDialog(context, state.error.errMsg);
        }
      },
      builder: (context, state) {
        if (state.status == WeatherStatus.initial) {
          return const Center(
            child: Text(
              'Sellect a city',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        if (state.status == WeatherStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == WeatherStatus.error && state.weather.name == '') {
          return const Center(
            child: Text(
              'Sellect a city',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            Text(
              state.weather.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  TimeOfDay.fromDateTime(state.weather.lastUpdated)
                      .format(context),
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  '(${state.weather.country})',
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ),
            SizedBox(
              height: 60.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  showTempruture(state.weather.temp),
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  children: [
                    Text(
                      showTempruture(state.weather.tempmax),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      showTempruture(state.weather.tempmin),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Spacer(),
                showIcon(state.weather.icon),
                Expanded(
                  flex: 3,
                  child: formatText(state.weather.description),
                ),
                Spacer(),
              ],
            ),
          ],
        );
      },
    );
  }
}
