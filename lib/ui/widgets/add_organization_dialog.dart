import 'package:demo/blocs/organizations/bloc/manage_organizations_bloc.dart';
import 'package:demo/util/value_validators.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../values/colors.dart';
import 'custom_button.dart';

class AddOrganizationDialog extends StatefulWidget {
  const AddOrganizationDialog({
    super.key,
  });

  @override
  State<AddOrganizationDialog> createState() => _AddOrganizationDialogState();
}

class _AddOrganizationDialogState extends State<AddOrganizationDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _orgNameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _addressLineController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _bankAccountController = TextEditingController();
  final TextEditingController _branchNameController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _ifscCodeController = TextEditingController();
  final TextEditingController _aboutOrgController = TextEditingController();
  Uint8List? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(boxBorederRadius),
      ),
      child: SizedBox(
        width: 500,
        height: 700,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add Organization",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          textStyle: Theme.of(context).textTheme.titleMedium,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(boxBorederRadius),
                        color: primaryColor,
                        child: InkWell(
                          hoverColor: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(boxBorederRadius),
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
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  PhotoPicker(
                    onPick: (file) {
                      selectedImage = file;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _orgNameController,
                    validator: validateName,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Organization Name",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _categoryController,
                    validator: validateName,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Category eg: orphanage or old age home",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: validateEmail,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: validateNumeric,
                    controller: _contactNumberController,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Contact Number",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _addressLineController,
                    validator: validateName,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Address line",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _placeController,
                    validator: validateName,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Place",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _districtController,
                    validator: validateName,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      hintText: "District",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _stateController,
                    validator: validateName,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      hintText: "State",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _pincodeController,
                    validator: validateAlphanumeric,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Pincode",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _bankAccountController,
                    validator: validateAlphanumeric,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Bank Account",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _bankNameController,
                    validator: validateName,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Bank Name",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: validateName,
                    controller: _branchNameController,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Branch Name",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: validateAlphanumeric,
                    controller: _ifscCodeController,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      hintText: "IFSC Code",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: validateName,
                    controller: _aboutOrgController,
                    maxLines: 5,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      hintText: "About Organization",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    text: "Save",
                    onTap: () {
                      if (selectedImage != null) {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<ManageOrganizationsBloc>(context).add(
                            AddOrganizationEvent(
                              image: selectedImage!,
                              phone: _contactNumberController.text.trim(),
                              email: _emailController.text.trim(),
                              category: _categoryController.text.trim(),
                              aboutOrg: _aboutOrgController.text.trim(),
                              addressLine: _addressLineController.text.trim(),
                              place: _placeController.text.trim(),
                              district: _districtController.text.trim(),
                              state: _stateController.text.trim(),
                              pincode: _pincodeController.text.trim(),
                              bankAccount: _bankAccountController.text.trim(),
                              bankName: _bankNameController.text.trim(),
                              branchName: _branchNameController.text.trim(),
                              ifscCode: _ifscCodeController.text.trim(),
                              name: _orgNameController.text.trim(),
                            ),
                          );
                          Navigator.pop(context);
                        }
                      } else {
                        //show select image dialog
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PhotoPicker extends StatefulWidget {
  final Function(Uint8List?) onPick;
  const PhotoPicker({
    super.key,
    required this.onPick,
  });

  @override
  State<PhotoPicker> createState() => _PhotoPickerState();
}

class _PhotoPickerState extends State<PhotoPicker> {
  Uint8List? pickedFile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Material(
        borderRadius: BorderRadius.circular(boxBorederRadius),
        color: Colors.white,
        child: InkWell(
          onTap: () async {
            FilePickerResult? res = await FilePicker.platform.pickFiles(
              type: FileType.image,
            );

            if (res != null) {
              pickedFile = res.files.first.bytes;
              widget.onPick(pickedFile);
              setState(() {});
            }
          },
          child: pickedFile != null
              ? Image.memory(
                  pickedFile!,
                  fit: BoxFit.cover,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      color: Colors.black26,
                    ),
                    Text(
                      "upload photo",
                      style: GoogleFonts.poppins(
                        color: Colors.black26,
                        textStyle: Theme.of(context).textTheme.bodySmall,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
