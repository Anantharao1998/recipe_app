import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/features/homepage/homepage.dart';

/// Widget to show today's appointments (Events)
class TodayEventTile extends StatelessWidget {
  /// Widget to show today's appointments (Events)
  const TodayEventTile({required this.listOfEvents, super.key});

  /// List of events
  final List<EventsItem> listOfEvents;

  @override
  Widget build(final BuildContext context) => Column(
        children: <Widget>[
          SectionTitle(
            title: AppStrings.todayEvents,
            onPressed: () {
              // TODO: Add Events function here
            },
          ),
          if (listOfEvents.isEmpty)
            Center(
              child: Text(
                AppStrings.commonEmptyList(item: 'event'),
              ),
            )
          else
            Column(
              children: <Widget>[
                ...listOfEvents.map(
                  (final EventsItem e) => ItemTile(item: e),
                ),
              ],
            ),
        ],
      );
}
