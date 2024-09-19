// widgets/button/scan_button.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:ibe_assistance/providers/person_user_provider.dart';
import 'package:ibe_assistance/screens/student/student_screen.dart';
import 'package:ibe_assistance/service/assistance_service.dart';
import 'package:ibe_assistance/widgets/button/bounce_button.dart';
import 'package:ibe_assistance/widgets/message/custom_popup.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  
  @override
  Widget build(BuildContext context) {
    var personUserProvider = Provider.of<PersonUserProvider>(context);    
    AssistanceService assistanceService = AssistanceService();
    
    return FloatingActionButton(
      //elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        String barcodeScanRes;
        try{
          barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                '#3D8BEF', 
                                'Cancelar', 
                                false, 
                                ScanMode.QR);
          print(barcodeScanRes);
        }on PlatformException{
          barcodeScanRes = 'ERROR: Fail to get platform version.';
        }
        print(barcodeScanRes);        
        String responseAssistance = await assistanceService.createAssistance(barcodeScanRes, personUserProvider.personUser);
        if(responseAssistance == "OK"){
          showDialog(
            context: context, 
            builder: (_) => CustomPopup(
                title: "Crea presentismo",
                message: "$responseAssistance Presente exitoso.",
                buttonAccept: BounceButton(
                  iconLeft: Icons.assistant_sharp,
                  buttonSize: ButtonSize.small,
                  type: ButtonType.primary,
                  label: "SUCCESS",
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => const StudentScreen())));
                  },
                ),
              )
          );
        }else{                        
          showDialog(
            context: context, 
            builder: (_) => CustomPopup(
              title: "Crea presentismo",
              message: "$responseAssistance No se pudo registrar su presentismo.",
              buttonAccept: BounceButton(
                iconLeft: Icons.error,
                buttonSize: ButtonSize.small,
                type: ButtonType.secondary,
                label: "ERROR",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          );
        }
      });
  }
}