part of 'manage_organizations_bloc.dart';

@immutable
abstract class ManageOrganizationsEvent {}

class GetAllOrganizationEvent extends ManageOrganizationsEvent {
  final String? query;
  final String status;

  GetAllOrganizationEvent({
    this.query,
    required this.status,
  });
}

class AddOrganizationEvent extends ManageOrganizationsEvent {
  final String name,
      phone,
      email,
      category,
      aboutOrg,
      addressLine,
      place,
      district,
      state,
      pincode,
      bankAccount,
      bankName,
      branchName,
      ifscCode;
  final PlatformFile image;

  AddOrganizationEvent(
      {required this.image,
      required this.phone,
      required this.email,
      required this.category,
      required this.aboutOrg,
      required this.addressLine,
      required this.place,
      required this.district,
      required this.state,
      required this.pincode,
      required this.bankAccount,
      required this.bankName,
      required this.branchName,
      required this.ifscCode,
      required this.name});
}

class EditOrganizationEvent extends ManageOrganizationsEvent {
  final int id;
  final String name,
      phone,
      email,
      category,
      aboutOrg,
      addressLine,
      place,
      district,
      state,
      pincode,
      bankAccount,
      bankName,
      branchName,
      ifscCode;
  final PlatformFile? image;

  EditOrganizationEvent({
    this.image,
    required this.phone,
    required this.email,
    required this.category,
    required this.aboutOrg,
    required this.addressLine,
    required this.place,
    required this.district,
    required this.state,
    required this.pincode,
    required this.bankAccount,
    required this.bankName,
    required this.branchName,
    required this.ifscCode,
    required this.id,
    required this.name,
  });
}

class ChangeStatusOrganizationEvent extends ManageOrganizationsEvent {
  final int id;
  final String status;

  ChangeStatusOrganizationEvent({
    required this.id,
    required this.status,
  });
}

class DeleteOrganizationEvent extends ManageOrganizationsEvent {
  final int id;

  DeleteOrganizationEvent({
    required this.id,
  });
}
