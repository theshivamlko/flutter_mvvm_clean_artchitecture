import 'package:json_annotation/json_annotation.dart';
part 'contacts_reponse.g.dart';

@JsonSerializable()
class ContactsResponse {
  late String mobile;
  late String link;
  ContactsResponse(this.mobile, this.link);

  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);
}
