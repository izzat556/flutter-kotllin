import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const batteryChannel = MethodChannel("battery");
  String batterylevel = "Waiting...";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
              "${batterylevel}",
            ),
            ElevatedButton(onPressed: (){
              getBateryLevel();
            }, child: Text("show"))
          ],
        ),
      ),
    );

  }
  Future getBateryLevel() async {
    final int battery =  await batteryChannel.invokeMethod("getbatterylevel");
    setState(() {
      batterylevel = "${battery}";
    });
  }
}
