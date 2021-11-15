import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final GestureTapCallback onClick;
  final Widget child;

  const GradientButton({Key? key, required this.child, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(13.0),
              primary: Colors.white,
              textStyle: const TextStyle(fontSize: 20),

            ),
            onPressed: onClick,
            child: child,
          ),
        ],
      ),
    );
  }
}
