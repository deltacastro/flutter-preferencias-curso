import 'package:flutter/material.dart';
import 'package:preferencias_app/providers/theme_provider.dart';
import 'package:preferencias_app/share_prefrences/preferences.dart';
import 'package:preferencias_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {

  static const String routeName = 'Setting';
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  // bool isDarkMode = false;
  // int gender = 1;
  // String name = 'pedro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes"),
      ),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ajustes', style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300)),

              Divider(),

              SwitchListTile(
                value: Preferences.isDarkMode,
                title: Text('Darkmode'),
                onChanged: (value){
                  Preferences.isDarkMode = value;
                  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

                  value
                    ? themeProvider.setDarkMode()
                    : themeProvider.setLightMode();

                  setState(() {});
                }
              ),

              Divider(),

              RadioListTile<int>(
                title: Text('Masculino'),
                value: 1,
                groupValue: Preferences.gender,
                onChanged: (value) {
                  Preferences.gender = value ?? 1;
                  setState(() {});
                }
              ),

              Divider(),

              RadioListTile<int>(
                title: Text('Femenino'),
                value: 2,
                groupValue: Preferences.gender,
                onChanged: (value) {
                  Preferences.gender = value ?? 2;
                  setState(() {});
                }
              ),

              Divider(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: Preferences.name,
                  onChanged: (value) {
                    Preferences.name = value;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre del usuario'
                  ),
                ),
              )


            ]
          ),
        ),
      ),
    );
  }
}