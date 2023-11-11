import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/request/RegisterRequestBody.dart';
import 'package:e_commerce/domain/repos/auth_repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  AuthRepo repo ;
  RegisterUseCase(this.repo);

  Future<Either<Failuer , bool>> execute(RegisterRequestBody body ){
    return repo.register(body);

  }
}