import 'package:clima_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class WeatherMainPage extends StatefulWidget {
  const WeatherMainPage({super.key});

  @override
  State<WeatherMainPage> createState() => _WeatherMainPageState();
}

class _WeatherMainPageState extends State<WeatherMainPage> {
  Map<String, dynamic> weatherData = {
    
  };

  @override
  void didChangeDependencies() async {
    await getWeatherByLocation();
    super.didChangeDependencies();
  }

  Future<void> getWeatherByLocation() async{
    final position = await Geolocator.getCurrentPosition();
    weatherData = await WeatherServices().getWeatherByLocation(position);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.location_on_rounded,
            size: 35,
            
          ),
          padding: EdgeInsets.only(left: 20),
          onPressed: () async{
            await getWeatherByLocation();
          },
        ),
        title: Text('Clima App'),
        centerTitle: true,
        actions: <Widget>[
          // Search Icon nt used yet
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            padding: EdgeInsets.only(right: 20),
            icon: Icon(
              Icons.location_city,
              color: Colors.white,
              size: 35,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.jpg"),
            fit: BoxFit.cover,
          )
        ),
        child: SafeArea(
          child: Center(
            child: weatherData.isEmpty ? const CircularProgressIndicator() : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                    Text(
                      "${weatherData['main']['temp'] as double}",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${weatherData['weather'][0]['description']}',
                      style: TextStyle(
                        fontSize: 35
                      ),
                    )
                  ],
                
            ),
          ),
        ),
      ),
    );
  }
}