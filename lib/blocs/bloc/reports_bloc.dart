import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'reports_event.dart';
part 'reports_state.dart';

class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  ReportsBloc() : super(ReportsInitialState()) {
    on<ReportsEvent>((event, emit) async {
      emit(ReportsLoadingState());
      try {
        SupabaseClient supabaseClient = Supabase.instance.client;
        SupabaseQueryBuilder orgReportTable =
            supabaseClient.from('organization_report');
        SupabaseQueryBuilder reqReportTable =
            supabaseClient.from('request_report');
        SupabaseQueryBuilder reqTable = supabaseClient.from('request');
        SupabaseQueryBuilder orgTable = supabaseClient.from('organizations');

        SupabaseQueryBuilder profileTable = supabaseClient.from('profile');

        if (event is GetReports) {
          List<dynamic> reports = [];
          if (event.type == 'req') {
            reports = await reqReportTable
                .select('*')
                .eq('status', event.status)
                .order('created_at');
          } else {
            reports = await orgReportTable
                .select('*')
                .eq('status', event.status)
                .order('created_at');
          }

          for (int i = 0; i < reports.length; i++) {
            reports[i]['user'] = await profileTable
                .select('*')
                .eq('user_id', reports[i]['user_id'])
                .single();

            if (event.type == 'req') {
              reports[i]['request'] = await reqTable
                  .select('*')
                  .eq('id', reports[i]['request_id'])
                  .single();
            } else {
              reports[i]['organization'] = await orgTable
                  .select('*')
                  .eq('id', reports[i]['organization_id'])
                  .single();
            }
          }
          Logger().w(reports);
          emit(ReportsSuccessState(reports: reports));
        } else if (event is HandleReports) {
          if (event.type == 'req') {
            await reqReportTable
                .update({'status': event.status}).eq('id', event.reportId);
          } else {
            await orgReportTable
                .update({'status': event.status}).eq('id', event.reportId);
          }

          add(GetReports(type: event.type, status: 'pending'));
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(ReportsFailureState());
      }
    });
  }
}
