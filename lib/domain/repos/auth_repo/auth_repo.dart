import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/request/RegisterRequestBody.dart';

abstract class AuthRepo{

  Future<Either<Failuer , bool>> login(String email , String pass);
  Future<Either<Failuer , bool>> register(RegisterRequestBody body);
}