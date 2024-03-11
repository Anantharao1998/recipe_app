import 'package:pokemondb/core/core.dart';

/// Animation extension
extension AnimationExtension on Widget {
  /// Slide down animation
  Widget slideDown({
    final Duration duration = const Duration(seconds: 2),
    final double begin = -100.0,
    final double end = 0.0,
  }) =>
      _SlideTransitionWidget(
        animationDuration: duration,
        begin: begin,
        end: end,
        child: this,
      );
}

class _SlideTransitionWidget extends StatefulWidget {
  const _SlideTransitionWidget({
    required this.child,
    required this.animationDuration,
    required this.begin,
    required this.end,
  });

  final Duration animationDuration;
  final double begin;
  final Widget child;
  final double end;

  @override
  State<_SlideTransitionWidget> createState() => _SlideTransitionWidgetState();
}

class _SlideTransitionWidgetState extends State<_SlideTransitionWidget> with SingleTickerProviderStateMixin {
  /// Animation Controller variable
  late final AnimationController _controller = AnimationController(
    duration: widget.animationDuration,
    vsync: this,
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset(0, widget.begin),
    end: Offset(0, widget.end),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller.animateTo(1);

    super.initState();
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
