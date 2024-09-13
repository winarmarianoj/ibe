// screens/admin/admin_screen.dart

import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'package:ibe_assistance/providers/assistance_form_provider.dart';
import 'package:ibe_assistance/widgets/drawers/body_admin_drawer.dart';
import 'package:ibe_assistance/widgets/drawers/draw_drawer.dart';
import 'package:provider/provider.dart';


class AdminScreen extends StatefulWidget{      
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: EmptyAppBar(context), 
      drawer: const DrawDrawer(),
      body: ChangeNotifierProvider(
        create: (_) => AssistanceFormProvider(),
        child: const BodyAdminDrawer(),
      ),
      //body: BodyAdminDrawer(),      
    );
  }

  AppBar EmptyAppBar(BuildContext context){
    return AppBar(
      elevation: 10,
      title: const Text(textTitleAppBarByUtn),
      actions: <Widget>[
        const SizedBox(width: textSizeDefaultPaddin / 2),        
        IconButton(
          icon: const Icon(Icons.search),
          tooltip: textToolTipSearch,
          onPressed: () {
            /*Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Search(),
              ),
            );*/
          },
        ),
      ],
    );
  }  
}