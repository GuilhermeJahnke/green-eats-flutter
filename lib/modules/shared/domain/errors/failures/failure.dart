import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure({
    required this.exception,
    this.data,
  });

  final dynamic exception;
  final dynamic data;

  @override
  List<Object?> get props => [
        exception,
        data,
      ];
}
