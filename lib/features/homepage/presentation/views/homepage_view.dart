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
  @override
  Widget build(final BuildContext context) => Scaffold(
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
                SizedBox(
                  height: kToolbarHeight,
                ),
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
