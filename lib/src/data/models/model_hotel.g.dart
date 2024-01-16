// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelHotel _$ModelHotelFromJson(Map<String, dynamic> json) => ModelHotel(
      id: json['id'] as int,
      name: json['name'] as String,
      adress: json['adress'] as String,
      minPrice: json['minimal_price'] as int,
      priceForIt: json['price_for_it'] as String,
      rating: json['rating'] as int,
      ratingName: json['rating_name'] as String,
      imageUrls: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      aboutTheHotel: json['about_the_hotel'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ModelHotelToJson(ModelHotel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'adress': instance.adress,
      'minimal_price': instance.minPrice,
      'rating': instance.rating,
      'price_for_it': instance.priceForIt,
      'rating_name': instance.ratingName,
      'image_urls': instance.imageUrls,
      'about_the_hotel': instance.aboutTheHotel,
    };
