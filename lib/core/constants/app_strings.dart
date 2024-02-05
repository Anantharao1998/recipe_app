// ignore_for_file: public_member_api_docs

class AppStrings {
  AppStrings._();

  static const String dashboard = 'Dashboard';
  static const String todayEvents = "Today's Event";
  static const String todayGoals = "Today's Goals";
  static const String totalAppointmentCompleted = 'Total Completed Appointments';
  static const String totalAppointmentsMade = 'Total Appointments Made';
  static const String totalProspect = 'Total Guests Connected';

  static String commonEmptyList({required final String item}) => 'There are no ${item.toLowerCase()}s.';
}
