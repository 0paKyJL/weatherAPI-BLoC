
class ApiData{
  String city;
  double feelsTemperature;
  double temperature;

  ApiData.fromApi(Map<String,dynamic> map)
      : this.temperature=map['main']['temp'],
        this.feelsTemperature=map['main']["feels_like"],
        this.city=map['name'];

}