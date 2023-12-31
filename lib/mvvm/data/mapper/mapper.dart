// convert response model to non nullable model

import 'package:flutter_mvvm_clean_artchitecture/mvvm/app/extensions.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/responses/authentication_response.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/responses/contacts_reponse.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/responses/customer_response.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/domain/models/authentication.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/domain/models/contacts.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/domain/models/customer.dart';

extension CustomerResponseMapper on CustomerResponse? {
  CustomerModel toDomain() {
    return CustomerModel(this?.id.orZero() ?? 0, this?.name.orEmpty() ?? "",
        this?.email.orEmpty() ?? "", this?.numOfNotification.orZero() ?? 0);
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  ContactsModel toDomain() {
    return ContactsModel(
        this?.mobile.orEmpty() ?? "", this?.link.orEmpty() ?? "");
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  AuthenticationModel toDomain() {
    return AuthenticationModel(
        this?.customerResponse.toDomain(), this?.contacts.toDomain());
  }
}
