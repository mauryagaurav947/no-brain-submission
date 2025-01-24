// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupModel _$GroupModelFromJson(Map<String, dynamic> json) => GroupModel(
      id: (json['Id'] as num?)?.toInt(),
      name: json['Name'] as String?,
      description: json['Description'] as String?,
      showDivisionReport: json['ShowDivisionReport'] as bool?,
      isActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$GroupModelToJson(GroupModel instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'Id': value,
      if (instance.name case final value?) 'Name': value,
      if (instance.description case final value?) 'Description': value,
      if (instance.showDivisionReport case final value?)
        'ShowDivisionReport': value,
      if (instance.isActive case final value?) 'IsActive': value,
    };
