

import 'package:dartz/dartz.dart';
import 'package:flutter_mvvm_clean_artchitecture/data/network/failure.dart';
import 'package:flutter_mvvm_clean_artchitecture/data/request/login_request.dart';
import 'package:flutter_mvvm_clean_artchitecture/data/responses/authentication_response.dart';
import 'package:flutter_mvvm_clean_artchitecture/domain/models/authentication.dart';

abstract class Repository{


 Future<Either<Failure,AuthenticationModel>> login(LoginRequest loginRequest);


}