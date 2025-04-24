part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}
final class ForgetPasswordAccept extends ForgetPasswordState {}
final class ForgetPasswordError extends ForgetPasswordState {
  final String errorMesseage;
  ForgetPasswordError({required this.errorMesseage});
}
final class ForgetPasswordLoading extends ForgetPasswordState {}
