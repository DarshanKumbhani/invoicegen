import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class pdfg {
  Future<File> pd(List d1) async {
    var pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(10),
        build: (pw.Context context) {
          return pw.Container(
            padding: pw.EdgeInsets.all(10),
            margin: pw.EdgeInsets.all(10),
            decoration: pw.BoxDecoration(
              borderRadius: pw.BorderRadius.circular(5),
              border: pw.Border.all(),
            ),
            child: pw.Column(
              children: [
                pw.Container(
                  margin: pw.EdgeInsets.all(5),
                  decoration: pw.BoxDecoration(
                    border: pw.Border(
                      bottom: pw.BorderSide(width: 2),
                    ),
                  ),
                  child: pw.Column(
                    children: [
                      pw.Text(
                        "${d1[2]}",
                        style:
                            pw.TextStyle(fontSize: 20, color: PdfColors.black),
                      ),
                      pw.Align(
                        alignment: pw.Alignment.topLeft,
                        child: pw.Text(
                          "GSTIN : ${d1[10]}",
                          style: pw.TextStyle(color: PdfColors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                //invoice details
                pw.Container(
                  margin: pw.EdgeInsets.all(5),
                  decoration: pw.BoxDecoration(
                    border: pw.Border(
                      bottom: pw.BorderSide(width: 2),
                    ),
                  ),
                  child: pw.Column(
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Invoice"),
                          pw.Text("${d1[4]}"),
                        ],
                      ),
                      pw.SizedBox(
                        height: 5,
                      ),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Invoice Date"),
                          pw.Text("${d1[5]}"),
                        ],
                      ),
                      pw.SizedBox(
                        height: 5,
                      ),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Due Date"),
                          pw.Text("${d1[6]}"),
                          pw.SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //Product details
                pw.Container(
                  margin: pw.EdgeInsets.all(5),
                  decoration: pw.BoxDecoration(
                    border: pw.Border(
                      bottom: pw.BorderSide(width: 2),
                    ),
                  ),
                  alignment: pw.Alignment.topLeft,
                  child: pw.Column(
                    children: [
                      pw.Text(
                        "Item Details",
                        style: pw.TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      pw.SizedBox(
                        height: 5,
                      ),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("${d1[7]}"),
                          pw.Text("${int.parse(d1[8]) * int.parse(d1[9])}"),
                        ],
                      ),
                      pw.SizedBox(
                        height: 5,
                      ),
                      pw.Align(
                          alignment: pw.Alignment.topLeft,
                          child: pw.Text(
                            "${d1[8]}*${d1[9]}",
                            style: pw.TextStyle(color: PdfColors.grey),
                          )),
                      pw.SizedBox(
                        height: 5,
                      ),
                      pw.Align(
                        alignment: pw.Alignment.topLeft,
                        child: pw.Text(
                          "CGST : ${(int.parse(d1[8]) * int.parse(d1[9]) * (12 / 100)).toStringAsFixed(2)} (12%)",
                          style: pw.TextStyle(color: PdfColors.grey),
                        ),
                      ),
                      pw.SizedBox(
                        height: 5,
                      ),
                      pw.Align(
                        alignment: pw.Alignment.topLeft,
                        child: pw.Text(
                          "SGST : ${(int.parse(d1[8]) * int.parse(d1[9]) * (12 / 100)).toStringAsFixed(2)} (12%)",
                          style: pw.TextStyle(color: PdfColors.grey),
                        ),
                      ),
                      pw.SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                //gst
                pw.Container(
                  margin: pw.EdgeInsets.all(5),
                  decoration: pw.BoxDecoration(
                    border: pw.Border(
                      bottom: pw.BorderSide(width: 2),
                    ),
                  ),
                  child: pw.Column(
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("subTotal"),
                          pw.Text(
                              "${double.parse(d1[8]) * double.parse(d1[9])}"),
                        ],
                      ),
                      pw.SizedBox(
                        height: 15,
                      ),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("CGST"),
                          pw.Text(
                              "${(double.parse(d1[8]) * double.parse(d1[9]) * (12 / 100)).toStringAsFixed(2)}"),
                        ],
                      ),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("SGST"),
                          pw.Text(
                              "${(double.parse(d1[8]) * double.parse(d1[9]) * (12 / 100)).toStringAsFixed(2)}"),
                        ],
                      ),
                    ],
                  ),
                ),
                //total
                pw.Container(
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text("Total Amount:"),
                      pw.Text(
                          "Rs.${((int.parse(d1[8]) * int.parse(d1[9])) + (int.parse(d1[8]) * int.parse(d1[9]) * (12 / 100)) + (int.parse(d1[8]) * int.parse(d1[9]) * (12 / 100))).toStringAsFixed(2)}"),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    Directory dir=await getApplicationDocumentsDirectory();
    File file =File('${dir.path}/Invoice.pdf');
    await file.writeAsBytes(await pdf.save());
    return file;
  }
}
