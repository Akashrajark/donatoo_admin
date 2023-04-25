import 'package:demo/ui/widgets/custom_action_button.dart';
import 'package:demo/ui/widgets/custom_alert_dialog.dart';
import 'package:demo/ui/widgets/custom_label_text.dart';
import 'package:demo/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../blocs/manage_organizations/manage_organizations_bloc.dart';
import '../widgets/add_organization_dialog.dart';
import '../widgets/custom_request_button.dart';
import '../widgets/custom_search.dart';

class OrganizationManagement extends StatefulWidget {
  const OrganizationManagement({super.key});

  @override
  State<OrganizationManagement> createState() => _OrganizationManagementState();
}

class _OrganizationManagementState extends State<OrganizationManagement> {
  final ManageOrganizationsBloc manageOrganizationsBloc =
      ManageOrganizationsBloc();

  String status = 'active';
  String? query;

  @override
  void initState() {
    super.initState();
    getOrganisations();
  }

  void getOrganisations() {
    manageOrganizationsBloc.add(
      GetAllOrganizationEvent(
        status: status,
        query: query,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: secondaryColor,
      child: Center(
        child: SizedBox(
          width: 1000,
          child: BlocProvider<ManageOrganizationsBloc>.value(
            value: manageOrganizationsBloc,
            child:
                BlocConsumer<ManageOrganizationsBloc, ManageOrganizationsState>(
              listener: (context, state) {
                if (state is ManageOrganizationsFailureState) {
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
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Wrap(
                      spacing: 20,
                      children: [
                        CustomRequestButton(
                          label: "Organizations",
                          isActive: status == 'active',
                          onTap: () {
                            status = 'active';
                            getOrganisations();
                          },
                        ),
                        CustomRequestButton(
                          label: "Banned Organization",
                          isActive: status == 'banned',
                          onTap: () {
                            status = 'banned';
                            getOrganisations();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Organizations",
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
                                getOrganisations();
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Material(
                            borderRadius:
                                BorderRadius.circular(boxBorederRadius),
                            color: primaryColor,
                            child: InkWell(
                              hoverColor: Colors.white.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.circular(boxBorederRadius),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      BlocProvider<
                                          ManageOrganizationsBloc>.value(
                                    value: manageOrganizationsBloc,
                                    child: const AddOrganizationDialog(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 22, vertical: 13),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "ADD",
                                      style: GoogleFonts.poppins(
                                        color: secondaryColor,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      Icons.add,
                                      color: secondaryColor,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(height: 1),
                    Expanded(
                      child: state is ManageOrganizationsSuccessState
                          ? state.organizations.isNotEmpty
                              ? ListView.separated(
                                  itemBuilder: (context, index) =>
                                      CustomOrganizationCard(
                                    manageOrganizationsBloc:
                                        manageOrganizationsBloc,
                                    organisationDetails:
                                        state.organizations[index],
                                  ),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 10),
                                  itemCount: state.organizations.length,
                                )
                              : const Center(
                                  child: Text('No Organisations Found!'))
                          : const Center(child: CupertinoActivityIndicator()),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CustomOrganizationCard extends StatelessWidget {
  final ManageOrganizationsBloc manageOrganizationsBloc;
  final dynamic organisationDetails;
  const CustomOrganizationCard({
    super.key,
    required this.organisationDetails,
    required this.manageOrganizationsBloc,
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
                        organisationDetails['photo'],
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
                        "#${organisationDetails['id'].toString()}",
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        organisationDetails['name'],
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          textStyle: Theme.of(context).textTheme.titleLarge,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        organisationDetails['category'],
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Funded",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '₹${organisationDetails['total_payment']}',
                        style: GoogleFonts.poppins(
                          color: Colors.green,
                          textStyle: Theme.of(context).textTheme.titleLarge,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  if (organisationDetails['status'] == 'active')
                    CustomActionButton(
                      iconData: Icons.block,
                      onPressed: () {
                        manageOrganizationsBloc.add(
                          ChangeStatusOrganizationEvent(
                            id: organisationDetails['id'],
                            status: 'banned',
                          ),
                        );
                      },
                      label: "Ban Organisation",
                      buttonType: ButtonType.secondary,
                    ),
                  if (organisationDetails['status'] == 'banned')
                    CustomActionButton(
                      iconData: Icons.done,
                      onPressed: () {
                        manageOrganizationsBloc.add(
                          ChangeStatusOrganizationEvent(
                            id: organisationDetails['id'],
                            status: 'active',
                          ),
                        );
                      },
                      label: "Unban Organisation",
                      buttonType: ButtonType.primary,
                    )
                ],
              ),
              const Divider(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      organisationDetails['about_org'],
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomLabelText(
                    label: "Email",
                    text: organisationDetails['email'],
                  ),
                  CustomLabelText(
                    alignment: CrossAxisAlignment.end,
                    label: "phone",
                    text: organisationDetails['phone'],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomLabelText(
                    label: "Address Line",
                    text: organisationDetails['address_line'],
                  ),
                  CustomLabelText(
                    alignment: CrossAxisAlignment.end,
                    label: "Place ",
                    text: organisationDetails['place'],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomLabelText(
                    label: "District",
                    text: organisationDetails['district'],
                  ),
                  CustomLabelText(
                    alignment: CrossAxisAlignment.end,
                    label: "State ",
                    text: organisationDetails['state'],
                  ),
                ],
              ),
              CustomLabelText(
                label: "Pincode ",
                text: organisationDetails['pincode'].toString(),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomLabelText(
                    label: "Bank Name",
                    text: organisationDetails['bank_name'],
                  ),
                  CustomLabelText(
                    alignment: CrossAxisAlignment.end,
                    label: "Branch Name",
                    text: organisationDetails['branch_name'],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomLabelText(
                    label: "Bank Account",
                    text: organisationDetails['bank_account'],
                  ),
                  CustomLabelText(
                    alignment: CrossAxisAlignment.end,
                    label: "IFSC code ",
                    text: organisationDetails['ifsc_code'],
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
