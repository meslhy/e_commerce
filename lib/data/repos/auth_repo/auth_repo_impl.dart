import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/request/RegisterRequestBody.dart';
import 'package:e_commerce/data/model/responses/AuthResponse.dart';
import 'package:e_commerce/domain/repos/auth_repo/auth_repo.dart';
import 'package:http/http.dart';

class AuthRepoImpl extends AuthRepo {

  @override
  Future<Either<Failuer,bool>> login(String email , String pass) async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult ==ConnectivityResult.wifi ||connectivityResult ==ConnectivityResult.mobile){
      Uri url = Uri.https(
          "ecommerce.routemisr.com","/api/v1/auth/signin");

      Response serverResponse = await post(url , body: {
        "email" : email,
        "password" : pass,
      });

      AuthResponse authResponse = AuthResponse.fromJson(jsonDecode(serverResponse.body));
      if(serverResponse.statusCode >=200 && serverResponse.statusCode < 300 ){
       
        return Right(true);
      }else{
        return left(Failuer(authResponse.message??"something error,try again later!!"));
      }
    }else{
      return Left(Failuer("Not Network connect.."));
    }
  }

  @override
  Future<Either<Failuer, bool>> register(RegisterRequestBody body) async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult ==ConnectivityResult.wifi ||connectivityResult ==ConnectivityResult.mobile){
      Uri url = Uri.https("ecommerce.routemisr.com","/api/v1/auth/signup");

      Response serverResponse = await post(url , body: {
        "name": body.name,
        "email":body.email,
        "password":body.password,
        "rePassword":body.rePassword,
        "phone":body.phone
      });

      AuthResponse authResponse = AuthResponse.fromJson(jsonDecode(serverResponse.body));
      if(serverResponse.statusCode >=200 && serverResponse.statusCode < 300 ){

        return Right(true);
      }else{
        return left(Failuer(authResponse.message??"something error,try again later!!"));
      }
    }else{
      return Left(Failuer("Not Network connect.."));
    }
  }

}