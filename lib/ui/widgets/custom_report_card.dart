import 'package:demo/blocs/bloc/reports_bloc.dart';
import 'package:demo/blocs/manage_organizations/manage_organizations_bloc.dart';
import 'package:demo/blocs/manage_requests/manage_requests_bloc.dart';
import 'package:demo/ui/screen/organization_management.dart';
import 'package:demo/ui/screen/request_management.dart';
import 'package:demo/ui/widgets/custom_action_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';
import 'custom_button.dart';
import 'custom_label_text.dart';

class CustomReportCard extends StatelessWidget {
  final ReportsBloc reportsBloc;
  final dynamic reportDetails;
  final String type;
  const CustomReportCard({
    super.key,
    required this.reportDetails,
    required this.type,
    required this.reportsBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(boxBorederRadius),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomLabelText(
                    label: "User Name:",
                    text: reportDetails['user']['name'],
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                if (type == 'org')
                  CustomActionButton(
                      iconData: Icons.business,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => CustomOrganizationCard(
                            organisationDetails: reportDetails['organization'],
                            manageOrganizationsBloc: ManageOrganizationsBloc(),
                          ),
                        );
                      },
                      label: 'Organization')
                else
                  CustomActionButton(
                      iconData: Icons.business,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: SizedBox(
                              width: 900,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomRequestCard(
                                    manageRequestBloc: ManageRequestBloc(),
                                    requestDetails: reportDetails['request'],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      label: 'Request'),
                const Expanded(child: SizedBox()),
                if (reportDetails['status'] == 'pending')
                  Expanded(
                    child: CustomButton(
                      text: "Done",
                      onTap: () {
                        reportsBloc.add(
                          HandleReports(
                            reportId: reportDetails['id'],
                            status: 'checked',
                            type: type,
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Report:",
              style: GoogleFonts.poppins(
                color: Colors.black,
                textStyle: Theme.of(context).textTheme.bodySmall,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text(
                reportDetails['reason'],
                style: GoogleFonts.poppins(
                  color: Colors.black54,
                  textStyle: Theme.of(context).textTheme.bodySmall,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
