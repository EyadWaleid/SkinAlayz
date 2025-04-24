part of 'login_form_cubit.dart';

@immutable
sealed class LoginFormState {}

final class LoginFormInitial extends LoginFormState {}
 class LoadingForm extends LoginFormState {}
 class LoginAccepted extends LoginFormState {}
 class LoginFail extends LoginFormState {
  final String errorMesseage;
  LoginFail({required this.errorMesseage});
 }