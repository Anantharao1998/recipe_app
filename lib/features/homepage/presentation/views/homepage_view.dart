// ignore_for_file: avoid_dynamic_calls

import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/features/homepage/homepage.dart';

/// MyHomePage
class HomeView extends BaseView {
  /// MyHomePage
  HomeView({
    super.key,
    super.appBarTitle = AppStrings.welcomeMessage,
  });

  @override
  List<Widget>? actionButtons() => <Widget>[
        IconButton(
          color: AppColors.whitePrimary,
          icon: const Icon(Icons.menu),
          onPressed: () => openDrawer(),
        ),
      ];

  @override
  Widget body(final BuildContext context) => Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            opacity: 0.3,
            image: AssetImage(
              AppAssets.backgroundImage,
            ),
          ),
        ),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GoalsTile(
                dailyGoalEntity: DailyGoalEntity(
                  totalAppointmentCompleted: 20,
                  totalAppointmentFixed: 20,
                  totalProspect: 20,
                ),
              ),
              TodayEventTile(
                listOfEvents: <EventsItem>[],
              ),
            ],
          ),
        ),
      );

  @override
  HomeDrawer drawer() => const HomeDrawer();
}
