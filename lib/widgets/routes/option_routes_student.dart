// widgets/routes/option_routes_student.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ibe_assistance/providers/theme_change_provider.dart';
import 'package:ibe_assistance/routes/routes.dart';
import 'package:provider/provider.dart';

class OptionRoutesApplicant extends StatelessWidget {
  const OptionRoutesApplicant({super.key});

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: ( context, i) => Divider(
          color: appTheme.primaryColorLight,
        ), 
        itemCount: pageRoutesStudent.length,
        itemBuilder: (context, i) => ListTile(
          leading: FaIcon( pageRoutesStudent[i].icon , color: appTheme.hintColor ),
          title: Text( pageRoutesStudent[i].titulo ),
          trailing: Icon( Icons.chevron_right, color: appTheme.hintColor ),
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context)=> pageRoutesStudent[i].page ));
          },
        ), 
      ), 
    );
  }
}