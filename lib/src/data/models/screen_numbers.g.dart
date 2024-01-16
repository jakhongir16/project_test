// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_numbers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreenNumbers _$ScreenNumbersFromJson(Map<String, dynamic> json) =>
    ScreenNumbers(
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => ScreenNumber.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScreenNumbersToJson(ScreenNumbers instance) =>
    <String, dynamic>{
      'rooms': instance.rooms,
    };
