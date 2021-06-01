
class ApiData{
  String city;
  String country;
  double feelsTemperature;
  double temperature;
  int pressure;

  ApiData.fromApi(Map<String,dynamic> map)
      : this.temperature=map['main']['temp'],
        this.feelsTemperature=map['main']["feels_like"],
        this.city=map['name'],
        this.pressure=map['main']['pressure'],
        this.country = map['sys']['country'];
}