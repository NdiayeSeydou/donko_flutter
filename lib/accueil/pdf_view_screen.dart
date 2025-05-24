import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewScreen extends StatelessWidget {
  final String pdfPath;

  PDFViewScreen({required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chap3 - Python")),
      body: PDFView(
        filePath: pdfPath,
      ),
    );
  }
}