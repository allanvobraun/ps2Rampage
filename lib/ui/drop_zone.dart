import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:ps2_rampage/ui/widgets/gradient_button.dart';

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
        child: Text(_filename ?? 'Arraste o arquivo bin aqui'),
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
      child: AnimatedOpacity(
        opacity: _dragging ? .8: 1,
        duration: const Duration(microseconds: 500),
        child: Container(
          height: 200,
          width: 700,
          color: Theme.of(context).colorScheme.secondary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _centerText,
              GradientButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 2),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                      Text('Procurar arquivos')
                    ],
                  ),
                  onClick: () {})
            ]
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(15),
                    child: e,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
