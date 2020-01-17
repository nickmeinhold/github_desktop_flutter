import 'dart:js' as js;
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

void main() {
  runApp(WebApp());
}

class WebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var uri = Uri.tryParse(js.context['location']['href'].toString());
    return MaterialApp(
      home: Center(
        child: FutureBuilder(
            future: http.read(
                'https://us-central1-flutter-github-desktop.cloudfunctions.net/helloWorld'),
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              switch (snapshot.connectionState) {
                case ConnectionState.none:

                  /// Not currently connected to any asynchronous computation.
                  return Text('None: ${snapshot.data}');
                  break;
                case ConnectionState.waiting:

                  /// Connected to an asynchronous computation and awaiting interaction.
                  return Text('Waiting: ${snapshot.data}');
                  break;
                case ConnectionState.active:

                  /// Connected to an active asynchronous computation.
                  return Text('Active: ${snapshot.data}');
                  break;
                case ConnectionState.done:

                  /// Connected to a terminated asynchronous computation.
                  return Text('Done: ${snapshot.data}');
                  break;

                default:
                  return Text('Unknown');
              }
            }),
        // Text(uri?.queryParameters.toString()),
      ),
    );
  }
}
