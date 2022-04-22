import 'package:equatable/equatable.dart';

abstract class Failure {
  String message;

  Failure(this.message);
}

class DatabaseFailure extends Failure with EquatableMixin {
  DatabaseFailure({String message = "Database Failure"}) : super(message);

  @override
  List<Object?> get props => [message];
}

class NetworkFailure extends Failure with EquatableMixin {
  NetworkFailure({String message = "Network Failure"}) : super(message);

  @override
  List<Object?> get props => [message];
}
