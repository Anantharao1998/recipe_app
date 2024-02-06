import 'package:pokemondb/core/core.dart';

/// BaseView for general use
abstract class BaseView extends StatelessWidget {
  /// BaseView for general use
  BaseView({this.hasAppBar = true, super.key});

  /// Pass false if appBar is not needed. True by default
  final bool hasAppBar;

  /// Global scaffold key
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  /// AppBar title
  String? appBarTitle() => null;

  /// Opens EndDrawer.
  void openDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  /// Close EndDrawer.
  void closeDrawer() {
    scaffoldKey.currentState!.closeEndDrawer();
  }

  /// AppBar action buttons
  List<Widget>? actionButtons() => null;

  /// Drawer
  Widget? drawer() => null;

  /// Floating action button
  Widget? floatingActionButton() => null;

  /// Body widget to  be passed to the Scaffold
  Widget body(final BuildContext context);

  @override
  Widget build(final BuildContext context) => Scaffold(
        floatingActionButton: floatingActionButton(),
        key: scaffoldKey,
        endDrawer: drawer(),
        appBar: hasAppBar
            ? AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.primaryColor,
                actions: actionButtons(),
                title: appBarTitle() != null
                    ? Text(
                        appBarTitle()!,
                        style: AppStyles.h4.white(),
                      )
                    : null,
              )
            : null,
        body: body(context),
      );
}
