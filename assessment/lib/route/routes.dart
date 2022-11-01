import 'package:flutter/material.dart';
import '../view/dashboard/dashboard.dart';
import '../view/participant/participant_details.dart';
import '../view/plans/plans.dart';
import '../view/statement/statement.dart';
import '../view/summary_report/summary_report.dart';
import '../view/user/login.dart';
import '../view/user/profile.dart';
import '../view/user/update_password.dart';

class Routes {
  Routes._();

  //static variables
  static const String login = '/login';
  static const String forgotpassword= '/forgot_password';
  static const String updatepassword= '/update_password';
  static const String pinsetscreen = '/pin_setup';
  static const String pinscreen = '/pin_screen';
  static const String pinupdate = '/pin_update';
  static const String dashboard = '/dashboard';
  static const String profile = '/profile';
  static const String claims = '/claims';
  static const String plans = '/plans';
  // ignore: constant_identifier_names
  static const String budget_report = '/budget_report';
  // ignore: constant_identifier_names
  static const String participant_details = '/participant_details';
  static const String statement = '/statement';
  static const String notificationSettings = '/notification_settings';
  static const String summaryReport = '/summary_report';

  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => LoginScreen(),
    updatepassword: (BuildContext context) => UpdatePassword(),
    pinsetscreen: (BuildContext context) => PinSetUp(),
    pinupdate: (BuildContext context) => PinUpdate(),
    pinscreen: (BuildContext context) => PinScreen(),
    dashboard: (BuildContext context) => DashboardScreen(),
    profile: (BuildContext context) => Profile(),
    claims: (BuildContext context) => Claims(),
    plans: (BuildContext context) => Plans(),
    participant_details: (BuildContext context) => ParticipantDetails(),
    statement: (BuildContext context) => Statement(),
    notificationSettings: (BuildContext context) => NotificationSettings(),
    summaryReport: (BuildContext context) => SummaryReport(),
  };
}