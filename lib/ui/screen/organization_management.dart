import 'package:demo/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import '../../blocs/organizations/bloc/manage_organizations_bloc.dart';
import '../widgets/add_organization_dialog.dart';
import '../widgets/custom_button.dart';
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
                    Expanded(
                      child: Material(
                        borderRadius: BorderRadius.circular(boxBorederRadius),
                        color: Colors.white,
                        child: Column(
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
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomSearch(
                                      onSearch: (query) {
                                        manageOrganizationsBloc.add(
                                            GetAllOrganizationEvent(
                                                status: 'active',
                                                query: query));
                                      },
                                    ),
                                  ),
                                  Material(
                                    borderRadius:
                                        BorderRadius.circular(boxBorederRadius),
                                    color: primaryColor,
                                    child: InkWell(
                                      hoverColor: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(
                                          boxBorederRadius),
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              BlocProvider<
                                                  ManageOrganizationsBloc>.value(
                                            value: manageOrganizationsBloc,
                                            child:
                                                const AddOrganizationDialog(),
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
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SingleChildScrollView(
                                  child: DataTable(
                                    headingRowHeight: 40,
                                    sortColumnIndex: 3,
                                    columnSpacing: 247,
                                    dataTextStyle: GoogleFonts.poppins(
                                      color: Colors.black54,
                                      textStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    headingTextStyle: GoogleFonts.poppins(
                                      color: Colors.black,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    columns: const [
                                      DataColumn(
                                        label: Text(
                                          "ID",
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          "Name",
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          "Address",
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          "Funded",
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          "",
                                        ),
                                      ),
                                    ],
                                    rows:
                                        state is ManageOrganizationsSuccessState &&
                                                state.organizations.isNotEmpty
                                            ? List<DataRow>.generate(
                                                state.organizations.length,
                                                (index) => DataRow(
                                                  cells: [
                                                    DataCell(
                                                      ConstrainedBox(
                                                        constraints:
                                                            const BoxConstraints(
                                                          maxWidth: 100,
                                                          minWidth: 10,
                                                        ),
                                                        child: Text(
                                                          state.organizations[
                                                                  index]['id']
                                                              .toString(),
                                                        ),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      ConstrainedBox(
                                                        constraints:
                                                            const BoxConstraints(
                                                          maxWidth: 300,
                                                          minWidth: 50,
                                                        ),
                                                        child: Text(
                                                          state.organizations[
                                                              index]['name'],
                                                        ),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      ConstrainedBox(
                                                          constraints:
                                                              const BoxConstraints(
                                                            maxWidth: 200,
                                                            minWidth: 50,
                                                          ),
                                                          child: Text(
                                                            state.organizations[
                                                                    index][
                                                                'address_line'],
                                                          )),
                                                    ),
                                                    DataCell(
                                                      ConstrainedBox(
                                                          constraints:
                                                              const BoxConstraints(
                                                            maxWidth: 120,
                                                            minWidth: 50,
                                                          ),
                                                          child: Text(
                                                            state.organizations[
                                                                index]['name'],
                                                          )),
                                                    ),
                                                    DataCell(
                                                      ConstrainedBox(
                                                        constraints:
                                                            const BoxConstraints(
                                                          maxWidth: 120,
                                                          minWidth: 50,
                                                        ),
                                                        child: CustomButton(
                                                          onTap: () {},
                                                          text: "Detail",
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : [],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
