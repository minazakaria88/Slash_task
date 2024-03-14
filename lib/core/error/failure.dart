import 'package:equatable/equatable.dart';

class Failure extends Equatable
{
  final String errorMsg;

  const Failure(this.errorMsg);
  @override
  List<Object?> get props => [];

}

class ServerFailure extends Failure
{
  const ServerFailure(super.errorMsg);

}