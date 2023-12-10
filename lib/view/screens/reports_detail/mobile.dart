import 'dart:io';
import 'package:assure_me/view/screens/reports_detail/report_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

Future<String> generatePDF(List<Datum>? data) async {
  final pdf = pw.Document();

  pdf.addPage(pw.MultiPage(
    build: (context) => [
      pw.Table.fromTextArray(context: context, data: <List<String>>[
        ['ID', 'Device ID', 'Temperature', 'Alarm'],
        for (final record in data!)
          [
            record.id.toString(),
            record.deviceId.toString(),
            record.temperature.toString(),
            record.alarm.toString(),
          ],
      ]),
    ],
  ));
  final directory = await getApplicationDocumentsDirectory();
  final path = '${directory.path}/example.pdf';
  final output = File(path);

  await output.writeAsBytes(await pdf.save());
  print("PDF generated at: ${output.path}");
  return path;
}
