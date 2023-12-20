// import 'dart:typed_data';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:playon/models/appointment.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AppointmentPdfView extends StatelessWidget {
  static const String routeName = "/AppointmentPdfView";
  const AppointmentPdfView({super.key});

  @override
  Widget build(BuildContext context) {
    final appointments =
        ModalRoute.of(context)?.settings.arguments as List<Appointment>;

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<File>(
        future: generateAppointmentDocument(appointments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final data = snapshot.data;
              return Center(child: SfPdfViewer.file(data!));
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<File> generateAppointmentDocument(
      List<Appointment> appointments) async {
    final pw.Document doc = pw.Document();

    // Generating PDF content
    final List<pw.TableRow> appointmentRows = appointments.map((appointment) {
      return pw.TableRow(
        children: [
          pw.Text(appointment.id),
          pw.Text(appointment.childName),
          // Add other fields similarly...
        ],
      );
    }).toList();

    doc.addPage(
      pw.MultiPage(
        pageFormat:
            PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
        build: (pw.Context context) {
          return [
            pw.Header(
              level: 1,
              text: 'Appointments',
            ),
            pw.Table(
              border: pw.TableBorder.all(),
              children: [
                pw.TableRow(
                  children: [
                    pw.Text('ID'),
                    pw.Text('Child Name'),
                    // Add headers for other fields...
                  ],
                ),
                ...appointmentRows,
              ],
            ),
          ];
        },
      ),
    );

    final tempDir = await getTemporaryDirectory();

    final file =
        await File('${tempDir.path}/test.pdf').writeAsBytes(await doc.save());
    return file;
  }
}
