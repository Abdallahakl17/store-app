// Error like 
//  401

// Token Expired

// Invalid Token


//____________________________________

 import 'package:store_app/core/error/failures/failures.dart';

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(super.message);
}