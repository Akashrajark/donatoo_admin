import 'package:demo/ui/widgets/custom_action_button.dart';
import 'package:demo/ui/widgets/custom_label_text.dart';
import 'package:demo/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../blocs/organizations/bloc/manage_organizations_bloc.dart';
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

  @override
  void initState() {
    super.initState();
    manageOrganizationsBloc.add(GetAllOrganizationEvent(status: 'active'));
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
                  //show dialog
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    state is ManageOrganizationsLoadingState
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: CupertinoActivityIndicator(),
                            ),
                          )
                        : const SizedBox(
                            height: 30,
                          ),
                    Wrap(
                      spacing: 20,
                      children: [
                        CustomRequestButton(
                          label: "Organizations",
                          amount: "10",
                          onTap: () {
                            manageOrganizationsBloc
                                .add(GetAllOrganizationEvent(status: 'active'));
                          },
                        ),
                        CustomRequestButton(
                          label: "Banned Organization",
                          amount: "10",
                          onTap: () {
                            manageOrganizationsBloc
                                .add(GetAllOrganizationEvent(status: 'banned'));
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 10,
                            right: 10,
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
                                  onSearch: (query) {
                                    manageOrganizationsBloc.add(
                                        GetAllOrganizationEvent(
                                            status: 'active', query: query));
                                  },
                                ),
                              ),
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
                                        horizontal: 22, vertical: 15),
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
                        const CustomOrganizationCard(),
                      ],
                    )
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
  const CustomOrganizationCard({
    super.key,
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
                      child: Image.asset(
                        "assets/img.jpg",
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
                        "#ID",
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Organizations",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          textStyle: Theme.of(context).textTheme.titleLarge,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Category",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "snksndfsndkfsndkfn",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  CustomActionButton(
                    iconData: Icons.block,
                    onPressed: () {},
                    label: "Block",
                    buttonType: ButtonType.secondary,
                  )
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomLabelText(
                    label: "Email",
                    text: "Donatoo@gmail.com",
                  ),
                  CustomLabelText(
                    alignment: CrossAxisAlignment.end,
                    label: "phone",
                    text: "7894561230",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomLabelText(
                    label: "addressline",
                    text: "enthohouse",
                  ),
                  CustomLabelText(
                    alignment: CrossAxisAlignment.end,
                    label: "place ",
                    text: "morazha",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomLabelText(
                    label: "district",
                    text: "enthohouse",
                  ),
                  CustomLabelText(
                    alignment: CrossAxisAlignment.end,
                    label: "state ",
                    text: "kerala",
                  ),
                ],
              ),
              const CustomLabelText(
                label: "pincode ",
                text: "456871",
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomLabelText(
                    label: "Bank Name",
                    text: "SBI",
                  ),
                  CustomLabelText(
                    alignment: CrossAxisAlignment.end,
                    label: "Branch Name",
                    text: "kerala",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomLabelText(
                    label: "Bank Account",
                    text: "45465454123",
                  ),
                  CustomLabelText(
                    alignment: CrossAxisAlignment.end,
                    label: "IFSC code ",
                    text: "56465465",
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
