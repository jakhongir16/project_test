import 'package:json_annotation/json_annotation.dart';

part 'model_hotel.g.dart';

@JsonSerializable()
class ModelHotel
{
  int id;
  String name;
  @JsonKey(name: 'adress')
  String adress;
  @JsonKey(name: 'minimal_price')
  int minPrice;
  int rating;
  @JsonKey(name: 'price_for_it')
  String priceForIt;
  @JsonKey(name: 'rating_name')
  String ratingName;
  @JsonKey(name: 'image_urls')
  List<String> imageUrls;
  @JsonKey(name: 'about_the_hotel')
  Map<String, dynamic> aboutTheHotel;

  ModelHotel({
    required this.id,
    required this.name,
    required this.adress,
    required this.minPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });

  factory ModelHotel.fromJson(Map<String, dynamic> json) => _$ModelHotelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelHotelToJson(this);
}

// @JsonSerializable()
// class AboutTheHotel
// {
//   String description;
//   @JsonKey(name: 'peculiarities')
//   List<String> characteristics;
//
//   AboutTheHotel({
//     required this.description,
//     required this.characteristics,
//   });
//
//   factory AboutTheHotel.fromJson(Map<String, dynamic> json) => _$AboutTheHotelFromJson(json);
//   Map<String, dynamic> toJson() => _$AboutTheHotelToJson(this);
// }
