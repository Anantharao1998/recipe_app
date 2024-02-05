// ignore_for_file: avoid_dynamic_calls

import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/features/homepage/homepage.dart';

/// MyHomePage
class MyHomePage extends StatefulWidget {
  /// MyHomePage

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(final BuildContext context) => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          actions: <Widget>[
            IconButton(
              color: AppColors.whitePrimary,
              icon: const Icon(Icons.menu),
              onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
            ),
          ],
          title: Text(
            AppStrings.welcomeMessage,
            style: AppStyles.h4.white(),
          ),
        ),
        endDrawer: const HomeDrawer(),
        body: Container(
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
        ),
      );
}
