
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/responses/base_responses.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/responses/contacts_reponse.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/responses/customer_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authentication_response.g.dart';

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponse? customerResponse;

  @JsonKey(name: "contacts")
  ContactsResponse? contacts;

  AuthenticationResponse(this.customerResponse, this.contacts);

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}
