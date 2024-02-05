import 'package:pokemondb/core/core.dart';

/// Drawer for home
class HomeDrawer extends StatelessWidget {
  /// Drawer for home
  const HomeDrawer({super.key});

  @override
  Widget build(final BuildContext context) => Drawer(
        child: Column(
          children: <Widget>[
            const ColoredBox(
              color: AppColors.primaryColor,
              child: SizedBox(
                width: double.infinity,
                height: AppValues.double_80,
              ),
            ),
            const _DrawerTile(AppStrings.events),
            const _DrawerTile(AppStrings.contacts),
            const _DrawerTile(AppStrings.appointments),
            const _DrawerTile(AppStrings.contactDev),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(AppValues.double_10),
              child: Align(
                child: Text(
                  // TODO: Get package version
                  'v1.0.0',
                  style: AppStyles.h5.primary(),
                ),
              ),
            ),
          ],
        ),
      );
}

class _DrawerTile extends StatelessWidget {
  const _DrawerTile(this.title);

  final String title;

  @override
  Widget build(final BuildContext context) => ListTile(
        onTap: () => debugPrint(title),
        title: Text(
          title,
          style: AppStyles.italic_5,
        ),
      ).underlined();
}
