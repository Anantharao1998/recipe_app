import 'package:pokemondb/core/core.dart';

/// Drawer for home
class HomeDrawer extends StatelessWidget {
  /// Drawer for home
  const HomeDrawer({required this.onClick, super.key});

  /// Callback when item clicked on Drawer
  final VoidCallback onClick;

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
            _DrawerTile(
              title: AppStrings.events,
              onTap: () async {
                onClick.call();
                await navigationService.navigateTo(Routes.eventsList);
              },
            ),
            _DrawerTile(
              title: AppStrings.contacts,
              onTap: () async {
                onClick.call();

                await navigationService.navigateTo(Routes.contactList);
              },
            ),
            const _DrawerTile(title: AppStrings.appointments),
            const _DrawerTile(title: AppStrings.contactDev),
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
  const _DrawerTile({required this.title, this.onTap});

  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(final BuildContext context) => ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: AppStyles.italic_5,
        ),
      ).underlined();
}
