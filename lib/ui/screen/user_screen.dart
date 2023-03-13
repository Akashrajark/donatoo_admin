import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: secondaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 8,
                    right: 10,
                  ),
                  child: SizedBox(
                    width: 250,
                    height: 35,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(40)),
                        fillColor: Colors.black12,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 2,
                        ),
                        suffixIcon: const Icon(Icons.search),
                        suffixIconColor: Colors.black38,
                      ),
                    ),
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
                        sortColumnIndex: 2,
                        columnSpacing: 247,
                        dataTextStyle: GoogleFonts.poppins(
                          color: Colors.black54,
                          textStyle: Theme.of(context).textTheme.bodySmall,
                          fontWeight: FontWeight.w500,
                        ),
                        headingTextStyle: GoogleFonts.poppins(
                          color: Colors.black,
                          textStyle: Theme.of(context).textTheme.bodyMedium,
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
                              "Funded",
                            ),
                          ),
                        ],
                        rows: List<DataRow>.generate(
                          100,
                          (index) => DataRow(
                            cells: [
                              DataCell(
                                ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      maxWidth: 100,
                                      minWidth: 10,
                                    ),
                                    child: const Text("123")),
                              ),
                              DataCell(
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxWidth: 300,
                                    minWidth: 50,
                                  ),
                                  child: const Text("New Home"),
                                ),
                              ),
                              DataCell(
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxWidth: 400,
                                    minWidth: 50,
                                  ),
                                  child: const Text("\$10"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
