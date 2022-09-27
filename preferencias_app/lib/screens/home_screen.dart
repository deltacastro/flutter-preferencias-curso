import 'package:flutter/material.dart';
import 'package:preferencias_app/share_prefrences/preferences.dart';
import 'package:preferencias_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  static const String routeName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      drawer: SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('isDarkmode: ${ Preferences.isDarkMode }'),
          Divider(),
          Text('Genero: ${ Preferences.gender }'),
          Divider(),
          Text('Nombre de usuario: ${ Preferences.name }')
        ],
      ),
    );
  }
}