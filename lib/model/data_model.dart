import 'package:json_annotation/json_annotation.dart';
part 'data_model.g.dart';

@JsonSerializable()
class DataModel {
  final int? id;
  final String? title;
  final String? description;
  final String? data;

  DataModel(this.id, this.title, this.description, this.data,  

  );
   factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
