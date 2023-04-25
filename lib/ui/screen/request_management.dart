import 'package:demo/blocs/manage_requests/manage_requests_bloc.dart';
import 'package:demo/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../widgets/custom_action_button.dart';
import '../widgets/custom_alert_dialog.dart';
import '../widgets/custom_label_text.dart';
import '../widgets/custom_request_button.dart';
import '../widgets/custom_search.dart';

class RequestManagement extends StatefulWidget {
  const RequestManagement({super.key});

  @override
  State<RequestManagement> createState() => _RequestManagementState();
}

class _RequestManagementState extends State<RequestManagement> {
  final ManageRequestBloc manageRequestBloc = ManageRequestBloc();

  String? query;
  String status = 'pending';

  void getRequests() {
    manageRequestBloc.add(
      GetAllRequestsEvent(
        status: status,
        query: query,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: secondaryColor,
      child: BlocProvider<ManageRequestBloc>.value(
        value: manageRequestBloc,
        child: BlocConsumer<ManageRequestBloc, ManageRequestState>(
          listener: (context, state) {
            if (state is ManageRequestsFailureState) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Failure',
                  message: state.message,
                  primaryButtonLabel: 'Ok',
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
                    Wrap(
                      spacing: 20,
                      children: [
                        CustomRequestButton(
                          isActive: status == 'pending',
                          label: "Pending Request",
                          onTap: () {
                            status = 'pending';
                            getRequests();
                          },
                        ),
                        CustomRequestButton(
                          label: "Active Request",
                          isActive: status == 'active',
                          onTap: () {
                            status = 'active';
                            getRequests();
                          },
                        ),
                        CustomRequestButton(
                          label: "Declined Request",
                          isActive: status == 'declined',
                          onTap: () {
                            status = 'declined';
                            getRequests();
                          },
                        ),
                        CustomRequestButton(
                          label: "Success Request",
                          isActive: status == 'complete',
                          onTap: () {
                            status = 'complete';
                            getRequests();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              top: 8,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Request",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      textStyle:
                                          Theme.of(context).textTheme.bodyLarge,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: CustomSearch(
                                    onSearch: (q) {
                                      query = q;
                                      getRequests();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: state is ManageRequestsSuccessState
                                ? state.requests.isNotEmpty
                                    ? ListView.separated(
                                        itemBuilder: (context, index) =>
                                            CustomRequestCard(
                                          manageRequestBloc: manageRequestBloc,
                                          requestDetails: state.requests[index],
                                        ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                          height: 10,
                                        ),
                                        itemCount: state.requests.length,
                                      )
                                    : const Center(
                                        child: Text('No Requests Found'),
                                      )
                                : const Center(
                                    child: CupertinoActivityIndicator(),
                                  ),
                          ),
                        ],
                      ),
                    )
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

class CustomRequestCard extends StatelessWidget {
  final ManageRequestBloc manageRequestBloc;
  final dynamic requestDetails;
  const CustomRequestCard({
    super.key,
    required this.manageRequestBloc,
    required this.requestDetails,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(boxBorederRadius),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      top: 5,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(boxBorederRadius),
                      child: Image.network(
                        requestDetails['image'],
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "#${requestDetails['id']}",
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        requestDetails['title'],
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          textStyle: Theme.of(context).textTheme.titleLarge,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        DateFormat('dd/MM/yyyy')
                            .format(DateTime.parse(requestDetails['duedate'])),
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          textStyle: Theme.of(context).textTheme.titleSmall,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '₹${requestDetails['total_payment']}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.lightGreen,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "/",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '₹${requestDetails['amount_required'] - requestDetails['amount_collected']}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  if (requestDetails['status'] == 'pending' ||
                      requestDetails['status'] == 'declined')
                    CustomActionButton(
                      iconData: Icons.block,
                      onPressed: () {
                        manageRequestBloc.add(UpdateRequestStatusEvent(
                            status: 'active', requestId: requestDetails['id']));
                      },
                      label: "Accept",
                      buttonType: ButtonType.primary,
                    ),
                  const SizedBox(
                    width: 10,
                  ),
                  if (requestDetails['status'] == 'pending' ||
                      requestDetails['status'] == 'active')
                    CustomActionButton(
                      iconData: Icons.block,
                      onPressed: () {
                        manageRequestBloc.add(UpdateRequestStatusEvent(
                            status: 'declined',
                            requestId: requestDetails['id']));
                      },
                      label: "Decline",
                      buttonType: ButtonType.secondary,
                    )
                ],
              ),
              const Divider(
                height: 30,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                requestDetails['description'],
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Divider(
                height: 30,
              ),
              Text(
                "Patient Details",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomLabelText(
                    label: "Full Name",
                    text: requestDetails['patient_name'],
                  ),
                  CustomLabelText(
                    alignment: CrossAxisAlignment.end,
                    label: "Phone",
                    text: requestDetails['patient_phone'],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomLabelText(
                    label: "Address Line",
                    text: requestDetails['patient_address_line'],
                  ),
                  CustomLabelText(
                    alignment: CrossAxisAlignment.end,
                    label: "Place ",
                    text: requestDetails['patient_place'],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomLabelText(
                    label: "District",
                    text: requestDetails['patient_district'],
                  ),
                  CustomLabelText(
                    alignment: CrossAxisAlignment.end,
                    label: "State ",
                    text: requestDetails['patient_state'],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              CustomLabelText(
                label: "Pincode",
                text: requestDetails['patient_pincode'].toString(),
              ),
              const Divider(
                height: 10,
              ),
              Text(
                "Hospital Details",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomLabelText(
                    label: "Full Name",
                    text: requestDetails['hospital_name'],
                  ),
                  CustomLabelText(
                    alignment: CrossAxisAlignment.end,
                    label: "Phone",
                    text: requestDetails['hospital_phone'],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomLabelText(
                    label: "Address Line",
                    text: requestDetails['hospital_address_line'],
                  ),
                  CustomLabelText(
                    alignment: CrossAxisAlignment.end,
                    label: "Place ",
                    text: requestDetails['hospital_place'],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomLabelText(
                    label: "District",
                    text: requestDetails['hospital_district'],
                  ),
                  CustomLabelText(
                    alignment: CrossAxisAlignment.end,
                    label: "State ",
                    text: requestDetails['hospital_state'],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              CustomLabelText(
                label: "Pincode",
                text: requestDetails['hospital_pincode'].toString(),
              ),
              const Divider(
                height: 10,
              ),
              Text(
                "Bank Details",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomLabelText(
                    label: "AccountHolder Name",
                    text: requestDetails['account_holder'],
                  ),
                  CustomLabelText(
                    alignment: CrossAxisAlignment.end,
                    label: "Branch Name",
                    text: requestDetails['branch_name'],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomLabelText(
                    label: "Bank Account",
                    text: requestDetails['bank_account_no'],
                  ),
                  CustomLabelText(
                    alignment: CrossAxisAlignment.end,
                    label: "IFSC code ",
                    text: requestDetails['ifsc_code'],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
