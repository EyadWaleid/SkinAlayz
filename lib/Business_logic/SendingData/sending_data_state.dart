part of 'sending_data_cubit.dart';

@immutable
sealed class SendingDataState {}

final class SendingDataInitial extends SendingDataState {}
final class SendingDataLoading extends SendingDataState {}
final class SendingDataAccepted extends SendingDataState {}
final class SendingDataFail extends SendingDataState {
  String errorMessage;
  SendingDataFail({required this.errorMessage });
}
