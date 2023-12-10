import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void generatePDF() async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text("Hello, Flutter PDF!"),
        );
      },
    ),
  );

  final output = File('example.pdf');
  await output.writeAsBytes(await pdf.save());
  print("PDF generated at: ${output.path}");
}
