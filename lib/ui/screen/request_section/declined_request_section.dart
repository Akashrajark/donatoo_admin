import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeclinedRequestSection extends StatelessWidget {
  const DeclinedRequestSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 8,
              right: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Declined Request",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 220,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        fillColor: Colors.black12,
                        contentPadding: const EdgeInsets.all(8),
                        suffixIcon: const Icon(Icons.search),
                        suffixIconColor: Colors.black38),
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
                  columnSpacing: 245,
                  sortColumnIndex: 3,
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
                        "Case",
                      ),
                    ),
                    DataColumn(
                      label: Text("Duedate"),
                    ),
                    DataColumn(
                      numeric: true,
                      label: Text("Reason"),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                    20,
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
                            child: const Text("opertaion"),
                          ),
                        ),
                        DataCell(
                          ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 100,
                                minWidth: 50,
                              ),
                              child: const Text("11/04/2023")),
                        ),
                        DataCell(
                          ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 400,
                                minWidth: 50,
                              ),
                              child: const Text("skjdfnksdnfsdfjnskj")),
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
    );
  }
}
