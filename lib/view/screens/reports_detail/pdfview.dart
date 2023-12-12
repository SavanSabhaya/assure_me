import 'package:assure_me/view/screens/reports/report_send.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewerPage extends StatelessWidget {
  final String pdfPath;

  PDFViewerPage({required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReportSend(),
                  ));
              print('get back from pdf');
            },
            child: Icon(Icons.arrow_back_rounded)),
        // actions: [Icon(Icons.arrow_back_rounded)],
        title: Text('Report'),
      ),
      body: PDFView(
        filePath: pdfPath,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: true,
        pageSnap: true,
        pageFling: true,
        onRender: (pages) {
          print("Pages: $pages");
        },
        onError: (error) {
          print(error.toString());
        },
        onPageChanged: (page, total) {
          print("Current page: $page, Total pages: $total");
        },
      ),
    );
  }
}

// void main() async {
//   final pdfPath = await generatePDF();
//   runApp(MaterialApp(
//     home: PDFViewerPage(pdfPath: pdfPath),
//   ));
// }
