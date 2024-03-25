import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';

/// BaseView for general use
abstract class BaseView<T extends BaseController> extends StatelessWidget with SnackBarHelper {
  /// BaseView for general use
  BaseView({this.hasAppBar = true, super.key});

  /// Pass false if appBar is not needed. True by default
  final bool hasAppBar;

  /// Global scaffold key
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  /// OnInit function will be called at initial state.
  void onInit(final T provider, final BuildContext context) => provider;

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
  Widget? floatingActionButton(final BuildContext context, final T controller) => null;

  /// Body widget to  be passed to the Scaffold
  Widget body(final BuildContext context, final T controller);

  Widget _showLoading() => const Center(child: Loading());

  @override
  Widget build(final BuildContext context) => ProviderViewBuilder<T>(
        onInit: (final T controller) => onInit.call(controller, context),
        builder: (final BuildContext ctxt, final T controller) => SafeArea(
          child: Stack(
            children: <Widget>[
              Scaffold(
                floatingActionButton: floatingActionButton(ctxt, controller),
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
                body: body(ctxt, controller),
              ),
              Selector<T, ViewState>(
                selector: (final BuildContext context, final T provider) => provider.viewState,
                builder: (final BuildContext context, final ViewState state, final _) =>
                    state == ViewState.loading ? _showLoading() : Container(),
              ),
            ],
          ),
        ),
      );
}
