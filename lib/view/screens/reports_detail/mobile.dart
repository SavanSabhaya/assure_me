import 'dart:io';
import 'package:assure_me/view/screens/reports_detail/report_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

Future<String> generatePDF(List<Data>? data) async {
  final pdf = pw.Document();

  pdf.addPage(pw.MultiPage(
    build: (context) => [
      pw.Table.fromTextArray(context: context, data: <List<String>>[
        [
          'Id',
          'Device Name',
          'Business Name',
          'Device Id',
          'Temperature',
          'Date & Time',
        ],
        for (final record in data!)
          [
            record.id.toString(),
            record.device?.deviceName.toString() ?? '',
            record.user?.name.toString() ?? '',
            record.deviceId.toString(),
            record.temperature.toString(),
            DateFormat('dd-MM-yyyy  HH:mm').format(record.createdAt!),
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
