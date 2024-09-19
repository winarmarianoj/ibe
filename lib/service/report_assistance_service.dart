// service/report_assistance_service.dart
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ibe_assistance/models/assistance.dart';
import 'package:ibe_assistance/models/person_user.dart';
import 'package:ibe_assistance/providers/assistance_form_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;

class ReportAssistanceService {  
  final String _baseUrl = 'ibeassistance-default-rtdb.firebaseio.com';  

  Future reportAssitance(AssistanceFormProvider assisForm, BuildContext context, PersonUser personUser) async{
    log("FECHA RECIBIDA");
    log(assisForm.dateFrom);    
    log("TOKEN"); log(personUser.token);
    final List<Assistance> assistances = [];
    
    final url = Uri.https(_baseUrl, '${assisForm.dateFrom}.json', {
      'auth': personUser.token
    });
    final resp = await http.get(url);

    final Map<String, dynamic> assistancesFromMap = json.decode(resp.body);
    print(assistancesFromMap);

    assistancesFromMap.forEach((key, value) {
      Assistance ass = Assistance(name: '', lastName: '', dni: '', grade: '', date: '', hour: '', minutes: '');
      ass.name = value["name"];
      ass.lastName = value["lastName"];
      ass.dni = value["dni"];
      ass.grade = value["grade"];
      ass.date = value["date"];
      ass.hour = value["hour"];
      ass.minutes = value["minutes"];

      log("ASS"); 
      log("${ass.name}/${ass.lastName}/${ass.dni}/${ass.grade}/${ass.date}/${ass.hour}/${ass.minutes}");

      assistances.add(ass);
    });

    // Create a new Excel Document.
    final Workbook workbook = Workbook();

    // Accessing sheet via index.
    final Worksheet sheet = workbook.worksheets[0];

    // Create Data Rows for importing.
    log("Assitance list");
    for (var ass in assistances) {      
      log("${ass.name}/${ass.lastName}/${ass.dni}/${ass.grade}/${ass.date}/${ass.hour}/${ass.minutes}");
    }
    final List<ExcelDataRow> dataRows = _buildReportDataRows(assistances);

    // Import the Data Rows in to Worksheet.
    sheet.importData(dataRows, 1, 1);

    // Save and dispose workbook.
    final List<int> bytes = workbook.saveSync();
    String nameFile = 'ReporteAsistencia-${assisForm.dateFrom}.xlsx';
    File(nameFile).writeAsBytes(bytes);
    workbook.dispose();

    if (kIsWeb) {
      AnchorElement(
          href:
              'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
        ..setAttribute('download', nameFile)
        ..click();
    } else {
      final String path = (await getApplicationSupportDirectory()).path;
      final String fileName =
          Platform.isWindows ? '$path\\$nameFile' : '$path/$nameFile';
      final File file = File(fileName);
      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open(fileName); 
    }

  }
  
  List<ExcelDataRow> _buildReportDataRows(List<Assistance> assistances) {
    List<ExcelDataRow> excelDataRows = <ExcelDataRow>[];

    excelDataRows = assistances.map<ExcelDataRow>((Assistance dataRow) {
      return ExcelDataRow(cells: <ExcelDataCell>[
        ExcelDataCell(columnHeader: 'Nombre', value: dataRow.name),
        ExcelDataCell(columnHeader: 'Apellido', value: dataRow.lastName),
        ExcelDataCell(columnHeader: 'DNI', value: dataRow.dni),
        ExcelDataCell(columnHeader: 'Curso', value: dataRow.grade),
        ExcelDataCell(columnHeader: 'Día', value: dataRow.date),
        ExcelDataCell(columnHeader: 'Hora', value: dataRow.hour),
        ExcelDataCell(columnHeader: 'Minutos', value: dataRow.minutes),
      ]);
    }).toList();

    return excelDataRows;
  }

  
}