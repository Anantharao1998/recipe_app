
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/dependency_injection.dart';

/// ProviderViewBuilder class used to manage base_view state.
class ProviderViewBuilder<T extends ChangeNotifier> extends StatefulWidget {
  /// ProviderViewBuilder constructor
  const ProviderViewBuilder({
    required this.builder,
    super.key,
    this.didChangeAppLifeCycle,
    this.onInit,
    this.provider,
  });

  /// Handles app lifecycle
  final Function(AppLifecycleState, T)? didChangeAppLifeCycle;
  /// Callback to be passed onInitState of a page.
  final Function(T provider)? onInit;
  /// Builder callback returns current Context and Controller [T] instance. 
  final Widget Function(BuildContext context, T value) builder;
  /// Pass Provider instance. Can be null.
  final T? provider;

  @override
  State<ProviderViewBuilder<T>> createState() => _ProviderViewBuilderState<T>();
}

class _ProviderViewBuilderState<T extends ChangeNotifier> extends State<ProviderViewBuilder<T>> with WidgetsBindingObserver {
  late T model;

  @override
  void didChangeAppLifecycleState(final AppLifecycleState state) {
    widget.didChangeAppLifeCycle?.call(state, model);
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    model = widget.provider ?? locator<T>();
    widget.onInit?.call(model);
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(final BuildContext _) => widget.provider != null
      ? ChangeNotifierProvider<T?>.value(
          value: widget.provider,
          child: widget.builder(context, widget.provider!),
        )
      : ChangeNotifierProvider<T>(
          create: (final BuildContext context) => model,
          builder: (final BuildContext ctx, final Widget? vm) => widget.builder(ctx, model),
        );
}
