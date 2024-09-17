import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

import 'credentials.dart'; // Importazione del pacchetto

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context); // Chiudi il drawer
              // Aggiungi qui la logica di navigazione se necessario
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Github project'),
            onTap: () {
              _launchURLBrowser("https://github.com/scaryalberto/radio_web");
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Author'),
            onTap: () {
              _launchURLBrowser("https://www.linkedin.com/in/alberto-aniello-scaringi-755b4a120");
              Navigator.pop(context);
              },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Credentials'),
            onTap: () {
              Navigator.pop(context); // Chiudi il drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CredentialsPage()),
              );
              },
          ),
        ],
      ),
    );
  }
}



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
