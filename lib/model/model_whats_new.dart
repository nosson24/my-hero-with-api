import 'package:json_annotation/json_annotation.dart';
part 'model_whats_new.g.dart';

@JsonSerializable()
class WhatsNewModel {
  final String? iconPath;
  final String? title;
  final String? description;

  WhatsNewModel(this.iconPath, this.title, this.description);

    factory WhatsNewModel.fromJson(Map<String, dynamic> json) =>
      _$WhatsNewModelFromJson(json);

  Map<String, dynamic> toJson() => _$WhatsNewModelToJson(this);
}
