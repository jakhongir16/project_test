import 'package:json_annotation/json_annotation.dart';

part 'screen_number.g.dart';

@JsonSerializable()
class ScreenNumber {
  int id;
  String name;
  int price;
  String price_per;
  List<String> peculiarities;
  List<String> image_urls;

  ScreenNumber({
    required this.id,
    required this.name,
    required this.price,
    required this.price_per,
    required this.peculiarities,
    required this.image_urls,
  });

  factory ScreenNumber.fromJson(Map<String, dynamic> json) =>
      _$ScreenNumberFromJson(json);
  Map<String, dynamic> toJson() => _$ScreenNumberToJson(this);
}
