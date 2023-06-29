abstract class Failure{}

class ServerFailure extends Failure {
  String? message;
  ServerFailure(this.message);
}

class CacheFailure extends Failure {}