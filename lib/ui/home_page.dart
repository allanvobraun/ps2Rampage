import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ps2_rampage/models/file_model.dart';
import 'package:ps2_rampage/ui/drop_zone.dart';
import 'package:ps2_rampage/ui/widgets/hover_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final fileModel = context.read<FileModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Dropzone(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 700,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HoverButton(
                        child: const Text('Cancelar'),
                        color: Colors.red,
                        onClick: !fileModel.isEmpty ? () {} : null),
                    HoverButton(
                        child: const Text('Converter'),
                        color: Colors.green,
                        onClick: !fileModel.isEmpty ? () {} : null),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
