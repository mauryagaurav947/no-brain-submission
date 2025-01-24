import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.pascal,
  includeIfNull: false,
)
class GroupModel extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final bool? showDivisionReport;
  final bool? isActive;

  const GroupModel({
    this.id,
    this.name,
    this.description,
    this.showDivisionReport,
    this.isActive,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) =>
      _$GroupModelFromJson(json);

  Map<String, dynamic> toJson() => _$GroupModelToJson(this);

  static List<GroupModel> fromMapList(List? json) {
    if (json == null) {
      return [];
    }
    return List<GroupModel>.from(
      json.map((v) => GroupModel.fromJson(v)),
    );
  }

  GroupModel copyWith({
    int? id,
    String? name,
    String? description,
    bool? showDivisionReport,
    bool? isActive,
  }) {
    return GroupModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      showDivisionReport: showDivisionReport ?? this.showDivisionReport,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      showDivisionReport,
      isActive,
    ];
  }
}
