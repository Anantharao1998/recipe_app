import 'package:pokemondb/core/core.dart';

/// BaseView for general use
abstract class BaseView extends StatelessWidget {
  /// BaseView for general use
  BaseView({this.appBarTitle, this.hasAppBar = true, super.key});

  /// AppBar title
  final String? appBarTitle;

  /// Pass false if appBar is not needed. True by default
  final bool hasAppBar;

  /// Global scaffold key
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  /// Opens EndDrawer.
  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  /// AppBar action buttons
  List<Widget>? actionButtons() => null;

  /// Drawer
  Widget? drawer() => null;

  /// Body widget to  be passed to the Scaffold
  Widget body(final BuildContext context);

  @override
  Widget build(final BuildContext context) => Scaffold(
        key: scaffoldKey,
        endDrawer: drawer(),
        appBar: hasAppBar
            ? AppBar(
                backgroundColor: AppColors.primaryColor,
                actions: actionButtons(),
                title: appBarTitle != null
                    ? Text(
                        appBarTitle!,
                        style: AppStyles.h4.white(),
                      )
                    : null,
              )
            : null,
        body: body(context),
      );
}
