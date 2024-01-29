import 'package:equatable/equatable.dart';

/// Daily Goals Entity
class DailyGoalEntity extends Equatable {
  /// Daily Goals Entity
  const DailyGoalEntity({
    required this.totalAppointmentCompleted,
    required this.totalAppointmentFixed,
    required this.totalProspect,
    this.currentAppointmentCompleted,
    this.currentAppointmentFixed,
    this.currentProspect,
  });

  /// No of current Appointments Completed
  final int? currentAppointmentCompleted;

  /// No of current Appointments Fixed
  final int? currentAppointmentFixed;

  /// No of current prospects added
  final int? currentProspect;

  /// No of total Appointments Completed
  final int totalAppointmentCompleted;

  /// No of total Appointments Fixed
  final int totalAppointmentFixed;

  /// No of total prospects added
  final int totalProspect;

  @override
  List<Object?> get props => <Object?>[
        currentAppointmentCompleted,
        currentAppointmentFixed,
        currentProspect,
        totalAppointmentCompleted,
        totalAppointmentFixed,
        totalProspect,
      ];
}
