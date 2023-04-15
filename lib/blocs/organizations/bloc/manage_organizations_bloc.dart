import 'package:bloc/bloc.dart';
import 'package:demo/values/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'manage_organizations_event.dart';
part 'manage_organizations_state.dart';

class ManageOrganizationsBloc
    extends Bloc<ManageOrganizationsEvent, ManageOrganizationsState> {
  ManageOrganizationsBloc() : super(ManageOrganizationsInitialState()) {
    on<ManageOrganizationsEvent>((event, emit) async {
      emit(ManageOrganizationsLoadingState());

      try {
        SupabaseClient supabaseClient = Supabase.instance.client;
        SupabaseQueryBuilder queryTable = supabaseClient.from('organizations');

        if (event is GetAllOrganizationEvent) {
          List<dynamic> tempOrgs = [];

          if (event.query != null) {
            tempOrgs = await queryTable
                .select('*')
                .eq('status', event.status)
                .ilike('name', '%${event.query}%')
                .order('name', ascending: true);
          } else {
            tempOrgs = await queryTable
                .select('*')
                .eq('status', event.status)
                .order('name', ascending: true);
          }

          List<Map<String, dynamic>> organizations =
              tempOrgs.map((e) => e as Map<String, dynamic>).toList();

          emit(ManageOrganizationsSuccessState(organizations: organizations));
        } else if (event is AddOrganizationEvent) {
          await queryTable.insert({
            'name': event.name,
            'phone': event.phone,
            'email': event.email,
            'category': event.category,
            'photo': '',
            'about_org': event.aboutOrg,
            'address_line': event.addressLine,
            'place': event.place,
            'district': event.district,
            'state': event.state,
            'pincode': event.pincode,
            'bank_account': event.bankAccount,
            'bank_name': event.bankName,
            'branch_name': event.branchName,
            'ifsc_code': event.ifscCode,
          });
          add(
            GetAllOrganizationEvent(status: 'active'),
          );
        } else if (event is EditOrganizationEvent) {
          await queryTable.update({
            'name': event.name,
            'phone': event.phone,
            'email': event.email,
            'category': event.category,
            'photo': '',
            'about_org': event.aboutOrg,
            'address_line': event.addressLine,
            'place': event.place,
            'district': event.district,
            'state': event.state,
            'pincode': event.pincode,
            'bank_account': event.bankAccount,
            'bank_name': event.bankName,
            'branch_name': event.branchName,
            'ifsc_code': event.ifscCode,
          }).eq('id', event.id);
          add(
            GetAllOrganizationEvent(status: 'active'),
          );
        } else if (event is ChangeStatusOrganizationEvent) {
          await queryTable.update({
            'status': event.status,
          }).eq('id', event.id);
          add(
            GetAllOrganizationEvent(status: 'active'),
          );
        } else if (event is DeleteOrganizationEvent) {
          await queryTable.delete().eq('id', event.id);
          add(
            GetAllOrganizationEvent(status: 'active'),
          );
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(ManageOrganizationsFailureState(message: e.toString()));
      }
    });
  }
}
