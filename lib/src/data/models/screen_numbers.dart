import 'package:json_annotation/json_annotation.dart';
import 'package:project_task/src/data/models/screen_number.dart';

part 'screen_numbers.g.dart';


@JsonSerializable()
class ScreenNumbers {
  List<ScreenNumber> rooms;

  ScreenNumbers({
    required this.rooms
});

  factory ScreenNumbers.fromJson(Map<String, dynamic> json) =>
      _$ScreenNumbersFromJson(json);
  Map<String, dynamic> toJson() => _$ScreenNumbersToJson(this);
}