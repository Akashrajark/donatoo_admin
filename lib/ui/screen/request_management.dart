import 'package:demo/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_action_button.dart';
import '../widgets/custom_label_text.dart';
import '../widgets/custom_request_button.dart';
import '../widgets/custom_search.dart';

class RequestManagement extends StatelessWidget {
  const RequestManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: secondaryColor,
      child: Center(
        child: SizedBox(
          width: 1000,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 20,
                children: [
                  CustomRequestButton(
                    label: "Active Request",
                    amount: "10",
                    onTap: () {},
                  ),
                  CustomRequestButton(
                    label: "Pending Request",
                    amount: "10",
                    onTap: () {},
                  ),
                  CustomRequestButton(
                    label: "Declined Request",
                    amount: "10",
                    onTap: () {},
                  ),
                  CustomRequestButton(
                    label: "Success Request",
                    amount: "10",
                    onTap: () {},
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
                              "Active Request",
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
                              onSearch: (query) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) =>
                            const CustomRequestCard(),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: 2,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRequestCard extends StatelessWidget {
  const CustomRequestCard({
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
                        "DueDate",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          textStyle: Theme.of(context).textTheme.titleSmall,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "120000",
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
                            "1000000",
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
                    label: "Accept",
                    buttonType: ButtonType.primary,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomActionButton(
                    iconData: Icons.block,
                    onPressed: () {},
                    label: "Block",
                    buttonType: ButtonType.secondary,
                  )
                ],
              ),
              const Divider(
                height: 10,
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
                children: const [
                  CustomLabelText(
                    label: "Full Name",
                    text: "Donatoo",
                  ),
                  CustomLabelText(
                    alignment: CrossAxisAlignment.end,
                    label: "phone",
                    text: "7894561230",
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
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
              const SizedBox(
                height: 5,
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
              const SizedBox(
                height: 5,
              ),
              const CustomLabelText(
                label: "pincode ",
                text: "456871",
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
                children: const [
                  CustomLabelText(
                    label: "Full Name",
                    text: "Donatoo",
                  ),
                  CustomLabelText(
                    alignment: CrossAxisAlignment.end,
                    label: "phone",
                    text: "7894561230",
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
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
              const SizedBox(
                height: 5,
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
              const SizedBox(
                height: 5,
              ),
              const CustomLabelText(
                label: "pincode ",
                text: "456871",
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
              const SizedBox(
                height: 5,
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
