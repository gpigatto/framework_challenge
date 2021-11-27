import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:framework_challenge/shared/widgets/button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

class CheckoutPdf extends StatelessWidget {
  final String pathPDF;
  final ByteData fileBytes;

  const CheckoutPdf({Key? key, required this.pathPDF, required this.fileBytes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _back(context),
                    _share(context),
                  ],
                ),
              ),
              _divider(),
              Expanded(
                child: Container(
                  child: PdfView(path: pathPDF),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _back(context) {
    const _icon = Icons.arrow_back_ios_new_rounded;
    const _borderColor = Colors.green;
    const _iconColor = Colors.green;

    return Button(
      borderColor: _borderColor,
      icon: _icon,
      iconColor: _iconColor,
      function: () => {
        Navigator.pop(context),
      },
    );
  }

  _share(context) {
    const _icon = Icons.share;
    const _borderColor = Colors.green;
    const _iconColor = Colors.green;

    return Button(
      borderColor: _borderColor,
      icon: _icon,
      iconColor: _iconColor,
      function: () => {
        shareLocalFile(),
      },
    );
  }

  _divider() {
    const _thickness = 1.2;
    const _color = Colors.green;

    return const Divider(
      thickness: _thickness,
      color: _color,
    );
  }

  void shareLocalFile() async {
    var _now = DateTime.now()
        .toString()
        .replaceAll(' ', '_')
        .replaceAll(':', '_')
        .replaceAll('.', '_');

    final directory = (await getExternalStorageDirectory())!.path;
    var _file = File('$directory/${_now}_checkin.pdf');

    _file.writeAsBytes(fileBytes.buffer.asUint8List());

    Share.shareFiles([_file.path], text: 'checkin $_now');

    // await Share.file('PDF', 'checkin.pdf', fileBytes.buffer.asUint8List(), 'application/pdf');
  }
}
