import 'package:demo/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';

class RequestDetail extends StatelessWidget {
  const RequestDetail({super.key});

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
                        "Request Name",
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
                    "Patient Details",
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
                    "Name",
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
                    "Age",
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
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          width: 0,
                          text: "Accept",
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Expanded(
                        child: CustomButton(
                          width: 0,
                          text: "Decline",
                          onTap: () {},
                        ),
                      ),
                    ],
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
