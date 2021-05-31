import 'package:meta/meta.dart';

class GetDataBody {
  final String city;

  GetDataBody({
    @required this.city,
  });

  Map<String, dynamic> toApi() {
    return {
      'name': city,
    };
  }
}