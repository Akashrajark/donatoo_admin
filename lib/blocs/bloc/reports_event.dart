part of 'reports_bloc.dart';

@immutable
abstract class ReportsEvent {}

class GetReports extends ReportsEvent {
  final String type, status;

  GetReports({required this.type, required this.status});
}

class HandleReports extends ReportsEvent {
  final int reportId;
  final String status, type;

  HandleReports({
    required this.reportId,
    required this.status,
    required this.type,
  });
}
