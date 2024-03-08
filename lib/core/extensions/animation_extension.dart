import 'package:pokemondb/core/core.dart';

/// Animation extension
extension AnimationExtension on Widget {
  /// Slide down animation
  Widget slideDown({
    final Duration duration = const Duration(seconds: 5),
    final double begin = -100.0,
    final double end = 0.0,
  }) =>
      _SlideTransitionWidget(child: this);
}

class _SlideTransitionWidget extends StatefulWidget {
  const _SlideTransitionWidget({required this.child});

  final Widget child;

  @override
  State<_SlideTransitionWidget> createState() => _SlideTransitionWidgetState();
}

class _SlideTransitionWidgetState extends State<_SlideTransitionWidget> with SingleTickerProviderStateMixin {
  /// Animation Controller variable
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..animateTo(1);

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticIn,
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => SlideTransition(
        position: _offsetAnimation,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: widget.child,
        ),
      );
}
