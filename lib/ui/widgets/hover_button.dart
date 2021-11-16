import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final VoidCallback? onClick;
  final Widget child;
  final MaterialColor color;

  const HoverButton({Key? key,
    required this.onClick,
    required this.child,
    required this.color})
      : super(key: key);

  @override
  State<HoverButton> createState() => _HoverState();
}

class _HoverState extends State<HoverButton> {

  bool _hovered = false;

  ButtonStyle get _style {
    return OutlinedButton.styleFrom(
        primary: _hovered ? Colors.white : widget.color,
        side: BorderSide(color: widget.color),
        backgroundColor: _hovered && !_disabled ? widget.color : null
    );
  }

  bool get _disabled => widget.onClick == null;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (details) {
        setState(() {
          _hovered = true;
        });
      },
      onExit: (details) {
        setState(() {
          _hovered = false;
        });
      },
      child: OutlinedButton(
        onPressed: widget.onClick,
        child: widget.child,
        style: _style,
      ),
    );
  }
}
