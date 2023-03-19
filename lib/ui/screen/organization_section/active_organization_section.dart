import 'package:demo/ui/widgets/custom_small_button.dart';
import 'package:demo/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_button.dart';

class ActiveOrganizationSection extends StatelessWidget {
  const ActiveOrganizationSection({
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
              top: 10,
              right: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "Organizations",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 220,
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30)),
                          fillColor: Colors.black12,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          suffixIcon: const Icon(Icons.search),
                          suffixIconColor: Colors.black38),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Material(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryColor,
                  child: InkWell(
                    hoverColor: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext conttext) => Dialog(
                          backgroundColor: secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SizedBox(
                            width: 500,
                            height: 700,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Add Organization",
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Material(
                                        borderRadius: BorderRadius.circular(10),
                                        color: primaryColor,
                                        child: InkWell(
                                          hoverColor:
                                              Colors.white.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 5,
                                            ),
                                            child: Icon(
                                              Icons.close,
                                              color: secondaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "enter following details",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      textStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 150,
                                    width: double.infinity,
                                    child: Material(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.add,
                                            color: Colors.black26,
                                          ),
                                          Text(
                                            "upload photo",
                                            style: GoogleFonts.poppins(
                                              color: Colors.black26,
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: TextField(
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      decoration: InputDecoration(
                                        hintStyle: GoogleFonts.poppins(
                                          color: Colors.black26,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        hintText: "Organization Name",
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: TextField(
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      decoration: InputDecoration(
                                        hintStyle: GoogleFonts.poppins(
                                          color: Colors.black26,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        hintText:
                                            "Category eg: orphanage or old age home",
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: TextField(
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      decoration: InputDecoration(
                                        hintStyle: GoogleFonts.poppins(
                                          color: Colors.black26,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        hintText: "Contact Number",
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextField(
                                    maxLines: 5,
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      textStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    decoration: InputDecoration(
                                      hintStyle: GoogleFonts.poppins(
                                        color: Colors.black26,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintText: "Address",
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                    ),
                                  ),
                                  TextField(
                                    maxLines: 5,
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      textStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    decoration: InputDecoration(
                                      hintStyle: GoogleFonts.poppins(
                                        color: Colors.black26,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintText: "About Organization",
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                    ),
                                  ),
                                  CustomButton(
                                    text: "Save",
                                    onTap: () {},
                                    textStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "ADD",
                            style: GoogleFonts.poppins(
                              color: secondaryColor,
                              textStyle: Theme.of(context).textTheme.bodySmall,
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
                            child: const Text("New Home"),
                          ),
                        ),
                        DataCell(
                          ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 200,
                                minWidth: 50,
                              ),
                              child: const Text("Morazha kannur")),
                        ),
                        DataCell(
                          ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 120,
                                minWidth: 50,
                              ),
                              child: const Text("10000000")),
                        ),
                        DataCell(
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 120,
                              minWidth: 50,
                            ),
                            child: CustomSmallButton(
                              onTap: () {},
                              text: "Detail",
                            ),
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
    );
  }
}
