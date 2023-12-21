import 'dart:convert';
import 'dart:developer';


import 'package:clima_app/utilities/convert_units_services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;



const String apikey = 'b23171c302e7f372975be2a0c4551084';
const String url = 'https://api.openweathermap.org/data/2.5/weather?';

class WeatherServices{
  //https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid={API key}
  //https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

  Future<Map<String, dynamic>> getWeatherByCityName(String city) async {
    final Uri uri = Uri.parse('${url}q=$city&appid=$apikey');
    final http.Response response = await http.get(uri);

    if(response.statusCode == 200){
       final Map<String, dynamic> data = jsonDecode(response.body) as Map<String, dynamic>;

        
        data['main']['temp'] = ConvertUnitsServices().kelvinToCelcius(data['main']['temp'] as double);
        
       return data;
    }else {
      return {};
    }
  }

  Future<Map<String, dynamic>>  getWeatherByLocation(Position position) async{
    final uri = Uri.parse('${url}lat=${position.latitude}&lon=${position.longitude}&appid=$apikey');
    final http.Response response = await http.get(uri);

    if(response.statusCode == 200){
       final Map<String, dynamic> data = jsonDecode(response.body) as Map<String, dynamic>;
      log('response body: ${response.body}');
        
        data['main']['temp'] = ConvertUnitsServices().kelvinToCelcius(data['main']['temp'] as double);
        
       return data;
    }else {
      return {};
    }
  }

}

// b23171c302e7f372975be2a0c4551084


