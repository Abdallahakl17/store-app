// errror from server like 
// 500
// 502

// 503
// __________________________




 import 'package:store_app/core/error/failures/failures.dart';

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}