import 'package:demo/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';

class OrganizationDetail extends StatelessWidget {
  const OrganizationDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Image.asset(
              "assets/img.jpg",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Organization Name",
                        style: GoogleFonts.roboto(
                          color: primaryColor,
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "#1224",
                        style: GoogleFonts.roboto(
                          color: primaryColor,
                          textStyle: Theme.of(context).textTheme.headlineMedium,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "\$ 100000",
                    style: GoogleFonts.roboto(
                      color: primaryColor,
                      textStyle: Theme.of(context).textTheme.headlineMedium,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Category",
                    style: GoogleFonts.roboto(
                      color: primaryColor,
                      textStyle: Theme.of(context).textTheme.headlineSmall,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "About organization d bahdsasjhdikas jsdguas jasahsdguna ashjbdjamsbdjamkascn jshdbajhsb asjhbdajsb jshbdhasc jnmhci asnbjasdjbas asjdkasn askjnndkajsdbnjnj skjdkasnjd asmdjnk",
                    style: GoogleFonts.roboto(
                      color: primaryColor,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Contact Number",
                    style: GoogleFonts.roboto(
                      color: primaryColor,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Address sdnfkasn sdnmalsd 45644 asldmd sjjndalsdn ",
                    style: GoogleFonts.roboto(
                      color: primaryColor,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  CustomButton(
                    textStyle: Theme.of(context).textTheme.titleLarge,
                    text: "Ban Organization",
                    onTap: () {},
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
