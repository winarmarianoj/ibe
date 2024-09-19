// widgets/assistance/date_picker_widget.dart

import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/color_constant.dart';
import 'package:ibe_assistance/providers/assistance_form_provider.dart';
import 'package:ibe_assistance/widgets/text/myText.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  final AssistanceFormProvider assistanceFormProvider;

  const DatePickerWidget({super.key, required this.assistanceFormProvider});
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState(assistanceFormProvider: assistanceFormProvider);
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  final AssistanceFormProvider assistanceFormProvider;
  DateTime date = DateTime.now();

  _DatePickerWidgetState({required this.assistanceFormProvider});

  String getText() {
    return DateFormat('yyyy/MM/dd').format(date);
    // return '${date.month}/${date.day}/${date.year}';
    }

  @override
  Widget build(BuildContext context) {
    return     
      /*ButtonHeaderWidget(
        title: 'Fecha',
        text: getText(),
        onClicked: () => pickDate(context),
      );*/
      MaterialButton(
        minWidth: 300,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        disabledColor: const Color.fromRGBO(158, 158, 158, 1),
        elevation: 0,
        color: themeDateFromAssistanceButton, 
        onPressed: () => pickDate(context),
        child: MyTitleMediumText(text: getText(), color: Colors.deepOrangeAccent, fontWeight: FontWeight.bold,)                  
      );
  }

  Future pickDate(BuildContext context) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(DateTime.now().year - 2),
      lastDate: DateTime(DateTime.now().year + 2),
    );

    if (newDate == null) return;

    setState(() => date = newDate);
    int yearStart = date.year;
    int monthStart = date.month;
    int dayStart = date.day;
    String dateStart = yearStart.toString() + (monthStart<10? "0$monthStart":monthStart.toString()) + (dayStart<10?"0$dayStart":dayStart.toString());
    assistanceFormProvider.dateFrom = dateStart;
    
  }

}
