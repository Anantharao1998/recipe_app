// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:pokemondb/dependency_injection.dart';

import 'package:provider/provider.dart';

class ProviderViewBuilder<T extends ChangeNotifier> extends StatefulWidget {
  const ProviderViewBuilder({
    required this.builder,
    super.key,
    this.didChangeAppLifeCycle,
    this.onInit,
    this.provider,
  });

  final Function(AppLifecycleState, T)? didChangeAppLifeCycle;
  final Function(T provider)? onInit;
  final Widget Function(BuildContext context, T value) builder;
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
