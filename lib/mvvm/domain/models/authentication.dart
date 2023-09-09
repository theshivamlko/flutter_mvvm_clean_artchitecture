
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/responses/base_responses.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/responses/contacts_reponse.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/responses/customer_response.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/domain/models/contacts.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/domain/models/customer.dart';
 import 'package:json_annotation/json_annotation.dart';


class AuthenticationModel   {
   ContactsModel? contactsModel;

   CustomerModel? customerModel;

   AuthenticationModel(this.customerModel, this.contactsModel);

}

