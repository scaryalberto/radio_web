import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_web_browser/flutter_web_browser.dart'; // Importazione del pacchetto
import 'drawer.dart'; // Importa il file drawer.dart
import 'radio_channels.dart'; // Importa il file radio_channels.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clickable ListView with URLs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  void _checkPermissions() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(
          'assets/image_for_splash_screen.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Usa la lista di canali dal file radio_channels.dart
  final Map<String, Map<String, String>> items = radioChannels;

  void _launchURLBrowser(String url) async {
    await FlutterWebBrowser.openWebPage(
      url: url,
      customTabsOptions: CustomTabsOptions(
        toolbarColor: Colors.blue,
        secondaryToolbarColor: Colors.green,
        navigationBarColor: Colors.amber,
        addDefaultShareMenuItem: true,
        instantAppsEnabled: true,
        showTitle: true,
        urlBarHidingEnabled: true,
      ),
      safariVCOptions: SafariViewControllerOptions(
        barCollapsingEnabled: true,
        preferredBarTintColor: Colors.blue,
        preferredControlTintColor: Colors.white,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Easy Web Radio'),
      ),
      drawer: AppDrawer(), // Usa il Drawer importato
      body: ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) {
          String key = items.keys.elementAt(index);
          return ListTile(
            leading: Image.network(items[key]!['icon']!),
            title: Text(key),
            onTap: () => _launchURLBrowser(items[key]!['url']!),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}
