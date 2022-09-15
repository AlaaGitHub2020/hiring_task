import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/user/user.dart';
import 'package:hiring_task/domain/user/user_failure.dart';

abstract class IUserRepository {
  Future<Either<UserFailure, User>> getUserDetails(String userId);
}
