// import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:playon/models/appointment.dart';

class AppointmentPdfView extends StatelessWidget {
  static const String routeName = "/AppointmentPdfView";
  const AppointmentPdfView({super.key});

  @override
  Widget build(BuildContext context) {
    final appointments =
        ModalRoute.of(context)?.settings.arguments as List<Appointment>;

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<Uint8List>(
        future: generateAppointmentDocument(appointments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return Image(image: MemoryImage(snapshot.data!));
            }
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Future<Uint8List> generateAppointmentDocument(
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

    return doc.save();
  }
}
