import 'package:pokemondb/core/core.dart';

/// Widget to show today's appointments (Events)
class TodayEventTile extends StatelessWidget {
  /// Widget to show today's appointments (Events)
  const TodayEventTile({super.key});

  @override
  Widget build(final BuildContext context) => Column(
        children: <Widget>[
          SectionTitle(
            title: AppStrings.todayEvents,
            onPressed: () {
              // TODO: Add Events
            },
          ),
        ],
      );
}
