import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:path_provider/path_provider.dart';

class PDFGerador<T> extends StatelessWidget {
  final List<T> dados;
  final String Function(T) mapItemToString;

  PDFGerador({required this.dados, required this.mapItemToString});

  Future<void> gerarPDF() async {
    final pdf = pdfLib.Document();

    pdf.addPage(
      pdfLib.Page(
        build: (context) {
          return pdfLib.Column(
            children: dados
                .map(
                  (item) => pdfLib.Text(mapItemToString(item)),
            )
                .toList(),
          );
        },
      ),
    );

    final output = await getExternalStorageDirectory();
    final file = File("${output!.path}/example.pdf");
    await file.writeAsBytes(await pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerador de Relatório'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: gerarPDF,
          child: Text('Pressione para gerar o PDF'),
        ),
      ),
    );
  }
}
