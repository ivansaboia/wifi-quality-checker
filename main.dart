import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wi-Fi Quality Checker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _connectionStatus = 'Checking...';

  @override
  void initState() {
    super.initState();
    _checkConnection();
  }

  Future<void> _checkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      if (connectivityResult == ConnectivityResult.wifi) {
        _connectionStatus = 'Connected to Wi-Fi';
      } else if (connectivityResult == ConnectivityResult.mobile) {
        _connectionStatus = 'Connected to Mobile Network';
      } else {
        _connectionStatus = 'No Internet Connection';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wi-Fi Quality Checker'),
      ),
      body: Center(
        child: Text(
          _connectionStatus,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
