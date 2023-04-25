part of 'reports_bloc.dart';

@immutable
abstract class ReportsState {}

class ReportsInitialState extends ReportsState {}

class ReportsLoadingState extends ReportsState {}

class ReportsSuccessState extends ReportsState {
  final List<dynamic> reports;

  ReportsSuccessState({required this.reports});
}

class ReportsFailureState extends ReportsState {}
