part of 'pages.dart';

class CheckEmail extends StatefulWidget {
  @override
  _CheckEmailState createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Back")),
      body: Center(
        child: RaisedButton(
          child: Text("Open App"),
          onPressed: () {
            DeviceApps.openApp('com.google.android.gm');
          }
        ),
      ),
    );
  }
}