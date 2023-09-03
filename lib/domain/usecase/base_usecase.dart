


import 'package:dartz/dartz.dart';
import 'package:flutter_mvvm_clean_artchitecture/data/network/failure.dart';

abstract class BaseUseClass<In,Out>{

  Future<Either<Failure,Out>> execute(In input);

}