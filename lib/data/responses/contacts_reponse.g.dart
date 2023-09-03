// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactsResponse _$ContactsResponseFromJson(Map<String, dynamic> json) =>
    ContactsResponse(
      json['mobile'] as String,
      json['link'] as String,
    );

Map<String, dynamic> _$ContactsResponseToJson(ContactsResponse instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'link': instance.link,
    };
