import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String code;
  final String message;
  final String plugin;

  const CustomError({
    required this.code,
    required this.message,
    required this.plugin,
  });

  @override
  List<Object> get props => [code, message, plugin];

  @override
  String toString() =>
      'CustomError(code: $code, message: $message, plugin: $plugin)';
}
