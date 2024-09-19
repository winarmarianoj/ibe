// screens/admin/bodies/body_admin_screen.dart

import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/color_constant.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/providers/assistance_form_provider.dart';
import 'package:ibe_assistance/providers/person_user_provider.dart';
import 'package:ibe_assistance/service/report_assistance_service.dart';
import 'package:ibe_assistance/widgets/assistance/date_picker_widget.dart';
import 'package:ibe_assistance/widgets/text/myText.dart';

import 'package:provider/provider.dart';

class BodyAdminScreen extends StatefulWidget{
  const BodyAdminScreen({super.key,});  

  @override
  State<BodyAdminScreen> createState() => _BodyAdminScreenState();
}

class _BodyAdminScreenState extends State<BodyAdminScreen> {

  @override
  Widget build(BuildContext context) {
    var personUserProvider = Provider.of<PersonUserProvider>(context);
    personUserProvider.personUser.setIsAdminHome = true;
    var assistanceFormProvider = Provider.of<AssistanceFormProvider>(context);     

    return Padding(      
      padding: const EdgeInsets.fromLTRB(2.0, 55.0, 2.0, 45.0),
      child: SizedBox(
        width: double.infinity,
        height: 450,
        child: Card(
          color: Colors.transparent, // const Color.fromARGB(255, 155, 57, 12),          
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0),),        
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: assistanceFormProvider.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 5),
                      const Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: MyBodyLargeText(
                          text: textTitleReportAdmin,
                          color: themeWindowText, // accentColor,
                          fontWeight: FontWeight.bold,
                          size: 20.00,
                        ),
                      ), 
                      const SizedBox(height: 5),                      
                      DatePickerWidget(assistanceFormProvider: assistanceFormProvider),
                      const SizedBox(height: 25),
                      MaterialButton(
                        shape: RoundedRectangleBorder(                          
                            borderRadius: BorderRadius.circular(20)),
                        disabledColor: themeLoginDisableButton,
                        elevation: 0,
                        color: themeAssistanceButton, 
                        onPressed: assistanceFormProvider.isLoading && assistanceFormProvider.dateFrom.isNotEmpty && assistanceFormProvider.dateTo.isNotEmpty
                            ? null
                            : () {
                                FocusScope.of(context).unfocus();
                                if (!assistanceFormProvider.isValidForm()) return;
                                Future.delayed(const Duration(seconds: 5));                          
                                ReportAssistanceService reportAssistanceService = ReportAssistanceService();
                                reportAssistanceService.reportAssitance(assistanceFormProvider, context, personUserProvider.personUser);
                              },
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40,
                            vertical: 10),
                            child: Text(
                              assistanceFormProvider.isLoading ? 'Procesando': 'Solicitar' ,                     
                              style: const TextStyle(color: themeLoginStateProccess),
                            ))                    
                      ),
              
                    ],
                  ),
            ),
          ),
        ),
      ),
    );
  }

}