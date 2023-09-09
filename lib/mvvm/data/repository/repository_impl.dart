import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/app/extensions.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/data_source/remote_data_source.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/network/error_handler.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/network/failure.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/network/network_info.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/request/login_request.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/responses/authentication_response.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/domain/models/authentication.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/domain/repository.dart';
import 'package:flutter_mvvm_clean_artchitecture/mvvm/data/mapper/mapper.dart';

class RepositoryImpl implements Repository {
  RemoteDataSource remoteDataSource;
  NetworkInfo networkInfo;

  RepositoryImpl(this.remoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, AuthenticationModel>> login(
      LoginRequest loginRequest) async {
    Either<Failure, AuthenticationModel> either =
        Left(Failure(0, "Something Gone Wrong"));
    try {
      if (await networkInfo.isConnected) {
        final response = await remoteDataSource.login(loginRequest);
        if (response.status == HttpStatus.ok) {
          either = Right(response.toDomain());
        } else {
          either = Left(0.getFailure());
        }
      } else {
        either = Left(HttpStatus.networkConnectTimeoutError.getFailure());
      }
    } catch (e) {
      print("RepositoryImpl $e");
      either = Left(ErrorHandler.handle(e).failure);
      return either;
      /*if (e is DioException) {
        final res = e.response;
        either = Left(Failure(res?.statusCode ?? 0,
            res?.statusMessage ?? "Something Gone Wrong"));
      }*/
    }
    return either;
  }
}
