import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/request/RegisterRequestBody.dart';
import 'package:e_commerce/data/model/responses/AuthResponse.dart';
import 'package:e_commerce/data/utils/shared_utils.dart';
import 'package:e_commerce/domain/repos/auth_repo/auth_repo.dart';
import 'package:e_commerce/ui/utils/constants.dart';
import 'package:e_commerce/ui/utils/end_points.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo )
class AuthRepoImpl extends AuthRepo {

  SharedPrefsUtils sharedPrefsUtils;
  Connectivity connectivity;
  AuthRepoImpl(this.connectivity , this.sharedPrefsUtils);

  @override
  Future<Either<Failuer,bool>> login(String email , String pass) async{
    final connectivityResult = await (connectivity.checkConnectivity());
    if(connectivityResult ==ConnectivityResult.wifi ||connectivityResult ==ConnectivityResult.mobile) {
      try{
      Uri url = Uri.https(
          EndPoints.baseUrl, EndPoints.login);

      Response serverResponse = await post(url, body: {
        "email": email,
        "password": pass,
      });

      AuthResponse authResponse = AuthResponse.fromJson(
          jsonDecode(serverResponse.body));
      if (serverResponse.statusCode >= 200 &&
          serverResponse.statusCode < 300) {
        sharedPrefsUtils.saveUser(authResponse.user!);
        sharedPrefsUtils.saveToken(authResponse.token!);
        return Right(true);
      } else {
        return left(Failuer(
            authResponse.message ?? Constants.defaultErrorMessage));
      }
    }catch(e){
        return left(Failuer(Constants.defaultErrorMessage));
      }
      } else {
      return Left(Failuer(Constants.internetErrorMessage));
    }

  }

  @override
  Future<Either<Failuer, bool>> register(RegisterRequestBody body) async {
    final connectivityResult = await (connectivity.checkConnectivity());
    if(connectivityResult ==ConnectivityResult.wifi ||connectivityResult ==ConnectivityResult.mobile){
      Uri url = Uri.https(EndPoints.baseUrl,EndPoints.register);

      Response serverResponse = await post(url , body: {
        "name": body.name,
        "email":body.email,
        "password":body.password,
        "rePassword":body.rePassword,
        "phone":body.phone
      });

      AuthResponse authResponse = AuthResponse.fromJson(jsonDecode(serverResponse.body));
      if(serverResponse.statusCode >=200 && serverResponse.statusCode < 300 ){
        
        sharedPrefsUtils.saveUser(authResponse.user!);
        sharedPrefsUtils.saveToken(authResponse.token!);
        return Right(true);
      }else{
        return left(Failuer(authResponse.message??"something error,try again later!!"));
      }
    }else{
      return Left(Failuer("Not Network connect.."));
    }
  }

}