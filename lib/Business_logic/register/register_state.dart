part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterLoading extends RegisterState {}
final class RegisterAccepted extends RegisterState {}
final class RegisterRejected extends RegisterState {
  String errorMessage;
  RegisterRejected({required this.errorMessage});
}
