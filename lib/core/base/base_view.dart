import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/dependency_injection.dart';
import 'package:provider/provider.dart';

/// BaseView for general use
abstract class BaseView<T extends BaseController> extends StatelessWidget {
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
  Widget? floatingActionButton(final T controller) => null;

  /// Body widget to  be passed to the Scaffold
  Widget body(final BuildContext context, final T controller);

  @override
  Widget build(final BuildContext context) => _ControllerHandler<T>(
        onInit: (final T controller) => onInit.call(controller, context),
        builder: (final BuildContext ctxt, final T controller) => SafeArea(
          child: Scaffold(
            floatingActionButton: floatingActionButton(controller),
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
            body: body(context, controller),
          ),
        ),
      );
}

class _ControllerHandler<T extends BaseController> extends StatefulWidget {
  const _ControllerHandler({required this.builder, this.onInit, super.key});

  final Function(T controller)? onInit;
  final Widget Function(BuildContext context, T controller) builder;

  @override
  State<_ControllerHandler<T>> createState() => __ControllerHandlerState<T>();
}

class __ControllerHandlerState<T extends BaseController> extends State<_ControllerHandler<T>> {
  late T controller;

  @override
  void initState() {
    controller = locator<T>();
    widget.onInit?.call(controller);
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => ChangeNotifierProvider<T>(
        create: (final _) => controller,
        builder: (final BuildContext ctxt, final _) => widget.builder(
          context,
          controller,
        ),
      );
}
