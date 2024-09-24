// widgets/routes/option_routes_admin.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ibe_assistance/providers/theme_change_provider.dart';
import 'package:ibe_assistance/routes/routes.dart';
import 'package:provider/provider.dart';

class OptionRoutesAdmin extends StatelessWidget {
  const OptionRoutesAdmin({super.key});

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: ( context, i) => Divider(
          color: appTheme.primaryColorLight,
        ), 
        itemCount: pageRoutesAdmin.length,
        itemBuilder: (context, i) => ListTile(
          leading: FaIcon( pageRoutesAdmin[i].icon , color: appTheme.hintColor ),
          title: Text( pageRoutesAdmin[i].titulo ),
          trailing: Icon( Icons.chevron_right, color: appTheme.hintColor ),
          onTap: () {
            Navigator.push(context,
             MaterialPageRoute(builder: (context)=> pageRoutesAdmin[i].page ));
          },
        ), 
      ),
    );
  }
}