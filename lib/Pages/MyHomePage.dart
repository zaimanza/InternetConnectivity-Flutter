import 'package:flutter/material.dart';
import 'package:internetconnectivity/Provider/ConnectivityProvider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false)
        .startConnectionProvider();
  }

  @override
  void dispose() {
    super.dispose();
    Provider.of<ConnectivityProvider>(context, listen: false)
        .disposeConnectionProvider();
  }

  // Platform messages are asynchronous, so we initialize in an async method.

  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectivityProvider>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Center(
            child: Text(
              'Connection Status: ${model.connectionStatus}',
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
