import 'package:flutter/material.dart';

typedef Child<T> = Widget Function(String seconds);

class AppCountdownWidget extends StatefulWidget {
  const AppCountdownWidget({
    super.key,
    required this.seconds,
    required this.child,
    this.childWhenCompleted,
    this.restart,
    this.onFinished,
  });

  final Child<String> child;
  final Widget? childWhenCompleted;
  final VoidCallback? onFinished;
  final ValueNotifier<bool>? restart;
  final int seconds;

  @override
  State<AppCountdownWidget> createState() => _AppCountdownWidgetState();
}

class _AppCountdownWidgetState extends State<AppCountdownWidget> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Duration duration;

  String get timerDisplayString {
    final duration = _controller.duration! * _controller.value;
    return duration.inSeconds.toString().padLeft(2, '0');
  }

  void startTimer() {
    duration = Duration(seconds: widget.seconds);
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    _controller
      ..reverse(from: widget.seconds.toDouble())
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
          widget.onFinished?.call();
        }
      });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    widget.restart?.addListener(() {
      if (widget.restart?.value == true) {
        _controller.reverse(from: widget.seconds.toDouble());
        widget.restart?.value = false;
      }
    });
  }

  @override
  void didUpdateWidget(AppCountdownWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.seconds != oldWidget.seconds) {
      setState(() {
        duration = Duration(seconds: widget.seconds);
        _controller.dispose();
        _controller = AnimationController(
          vsync: this,
          duration: duration,
        );
        _controller
          ..reverse(from: widget.seconds.toDouble())
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) widget.onFinished?.call();
          });
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, Widget? child) {
          return _controller.status == AnimationStatus.dismissed
              ? widget.childWhenCompleted ?? widget.child(timerDisplayString)
              : widget.child(timerDisplayString);
        },
      ),
    );
  }
}
