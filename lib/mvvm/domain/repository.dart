

import 'package:dartz/dartz.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/network/failure.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/request/login_request.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/responses/authentication_response.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/domain/models/authentication.dart';

abstract class Repository{


 Future<Either<Failure,AuthenticationModel>> login(LoginRequest loginRequest);


}