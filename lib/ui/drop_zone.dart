import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ps2_rampage/models/file_model.dart';
import 'package:ps2_rampage/ui/widgets/gradient_button.dart';

class Dropzone extends StatefulWidget {
  const Dropzone({Key? key}) : super(key: key);

  @override
  _DropzoneState createState() => _DropzoneState();
}

class _DropzoneState extends State<Dropzone> {
  bool _dragging = false;

  Widget get _centerText => Consumer<FileModel>(
        builder: (context, fileModel, child) => Center(
          child: Text(fileModel.filename ?? 'Arraste o arquivo bin aqui'),
        ),
      );

  @override
  Widget build(BuildContext context) {
    var fileModel = context.read<FileModel>();

    return DropTarget(
      onDragDone: (detail) {
        fileModel.changeUri(detail.urls[0]);
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
        opacity: _dragging ? .8 : 1,
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
                child: const Text('Procurar arquivos'),
                onClick: () {},
                icon: Icons.search,
              )
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
