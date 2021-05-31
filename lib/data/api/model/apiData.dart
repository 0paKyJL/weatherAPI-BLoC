


class ApiData{
  String city;
  String description;
  int temperature;

  ApiData.fromApi(Map<String,dynamic> map)
      : this.temperature=map['main']['temp'],
        this.description=map['weather']['description'],
        this.city=map['name'];

}