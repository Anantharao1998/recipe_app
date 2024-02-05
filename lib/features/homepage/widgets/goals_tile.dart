import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/features/homepage/homepage.dart';

/// Today's goal tile
class GoalsTile extends StatelessWidget {
  /// Today's goal tile
  const GoalsTile({required this.dailyGoalEntity, super.key});

  /// Daily Goal Entity object
  final DailyGoalEntity dailyGoalEntity;

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SectionTitle(
            title: AppStrings.todayGoals,
            subtitle: DateTime.now().ddMMyyyy(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TargetBox(
                boxTitle: AppStrings.totalProspect,
                maxValue: dailyGoalEntity.totalProspect,
                minValue: dailyGoalEntity.currentProspect ?? 0,
              ),
              TargetBox(
                boxTitle: AppStrings.totalAppointmentsMade,
                maxValue: dailyGoalEntity.totalProspect,
                minValue: dailyGoalEntity.currentProspect ?? 0,
              ),
              TargetBox(
                boxTitle: AppStrings.totalAppointmentCompleted,
                maxValue: dailyGoalEntity.totalProspect,
                minValue: dailyGoalEntity.currentProspect ?? 0,
              ),
            ],
          ),
        ],
      );
}

/// Target Box Widget
class TargetBox extends StatelessWidget {
  /// Target Box Widget
  const TargetBox({required this.boxTitle, required this.minValue, required this.maxValue, super.key});

  /// Target box title
  final String boxTitle;

  /// Max Value for target box
  final int maxValue;

  /// Min value for target box
  final int minValue;

  @override
  Widget build(final BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width - AppValues.double_50;

    return Container(
      constraints: const BoxConstraints(minHeight: AppValues.double_140),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppValues.double_10,
        ),
        color: AppColors.primaryColor,
      ),
      width: screenWidth / 3,
      padding: const EdgeInsets.all(AppValues.double_10),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                minValue.toString(),
                style: AppStyles.h2.white(),
              ),
              Text(
                ' / ',
                style: AppStyles.h4.white(),
              ),
              Text(
                maxValue.toString(),
                style: AppStyles.h4.white(),
              ),
            ],
          ),
          const SizedBox(
            height: AppValues.double_10,
          ),
          Text(
            boxTitle,
            style: AppStyles.h6.white(),
          ),
        ],
      ),
    );
  }
}
