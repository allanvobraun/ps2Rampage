import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dropzone extends StatefulWidget {
  const Dropzone({Key? key}) : super(key: key);

  @override
  _DropzoneState createState() => _DropzoneState();
}

class _DropzoneState extends State<Dropzone> {
  Uri? _filePath;

  bool _dragging = false;

  String? get _filename => _filePath?.path.split("/").last;

  Widget get _centerText => Center(
        child: Text(_filename ?? 'drop text'),
      );

  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragDone: (detail) {
        setState(() {
          _filePath = detail.urls[0];
        });
      },
      onDragEntered: (detail) {
        setState(() {
          _dragging = true;
        });
      },
      onDragExited: (detail) {
        setState(() {
          _dragging = false;
        });
      },
      child: Container(
        height: 200,
        width: 700,
        color: Theme.of(context).colorScheme.secondary,
        child: _centerText,
      ),
    );
  }
}
