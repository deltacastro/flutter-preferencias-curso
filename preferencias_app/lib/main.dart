import 'package:flutter/material.dart';
import 'package:preferencias_app/providers/theme_provider.dart';
import 'package:preferencias_app/screens/screens.dart';
import 'package:preferencias_app/share_prefrences/preferences.dart';
import 'package:provider/provider.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkMode: Preferences.isDarkMode)
        )
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SettingScreen.routeName: (_) => const SettingScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme
    );
  }
}