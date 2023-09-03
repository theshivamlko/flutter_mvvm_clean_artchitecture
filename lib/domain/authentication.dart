
import 'package:flutter_mvvm_clean_artchitecture/data/responses/base_responses.dart';
import 'package:flutter_mvvm_clean_artchitecture/data/responses/contacts_reponse.dart';
import 'package:flutter_mvvm_clean_artchitecture/data/responses/customer_response.dart';
import 'package:json_annotation/json_annotation.dart';


class AuthenticationResponse extends BaseResponse {
   CustomerResponse? customerResponse;

   ContactsResponse? contacts;

  AuthenticationResponse(this.customerResponse, this.contacts);

}
