import 'package:demo/blocs/bloc/reports_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../values/colors.dart';
import '../widgets/custom_alert_dialog.dart';
import '../widgets/custom_report_card.dart';
import '../widgets/custom_request_button.dart';

class RequestReportScreen extends StatefulWidget {
  const RequestReportScreen({super.key});

  @override
  State<RequestReportScreen> createState() => _RequestReportScreenState();
}

class _RequestReportScreenState extends State<RequestReportScreen> {
  final ReportsBloc reportsBloc = ReportsBloc();

  String status = 'pending'; // and checked

  void getReports() {
    reportsBloc.add(
      GetReports(
        type: 'req',
        status: status,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getReports();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: secondaryColor,
      child: BlocProvider<ReportsBloc>.value(
        value: reportsBloc,
        child: BlocConsumer<ReportsBloc, ReportsState>(
          listener: (context, state) {
            if (state is ReportsFailureState) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Failure',
                  message:
                      'Something went wrong, please check your connection and try again',
                  primaryButtonLabel: 'Ok',
                  primaryOnPressed: () {
                    getReports();
                  },
                ),
              );
            }
          },
          builder: (context, state) {
            return Center(
              child: SizedBox(
                width: 1000,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Wrap(
                      spacing: 20,
                      children: [
                        CustomRequestButton(
                          label: "Pending Report",
                          isActive: status == 'pending',
                          onTap: () {
                            status = 'pending';
                            getReports();
                          },
                        ),
                        CustomRequestButton(
                          label: "Checked Report",
                          isActive: status == 'checked',
                          onTap: () {
                            status = 'checked';
                            getReports();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: state is ReportsSuccessState
                          ? state.reports.isNotEmpty
                              ? Material(
                                  child: SizedBox(
                                    width: 890,
                                    child: ListView.separated(
                                      itemBuilder: (context, index) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: CustomReportCard(
                                          reportDetails: state.reports[index],
                                          type: 'req',
                                          reportsBloc: reportsBloc,
                                        ),
                                      ),
                                      separatorBuilder: (context, index) =>
                                          const Divider(
                                        height: 10,
                                        thickness: 10,
                                        color: secondaryColor,
                                      ),
                                      itemCount: state.reports.length,
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: Text('No reports found'),
                                )
                          : const Center(
                              child: CupertinoActivityIndicator(),
                            ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
