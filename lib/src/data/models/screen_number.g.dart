// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreenNumber _$ScreenNumberFromJson(Map<String, dynamic> json) => ScreenNumber(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      price_per: json['price_per'] as String,
      peculiarities: (json['peculiarities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      image_urls: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ScreenNumberToJson(ScreenNumber instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'price_per': instance.price_per,
      'peculiarities': instance.peculiarities,
      'image_urls': instance.image_urls,
    };
