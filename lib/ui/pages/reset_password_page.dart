part of 'pages.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailText = TextEditingController();

  void notif(){
    AlertDialog alertDialog = AlertDialog(
      content: Container(
        height: 100.0,
        child: Column(
          children: [
            Text("Silahkan Cek Email"),
            RaisedButton(
              child: Text("OK"),
              onPressed: () =>  Navigator.pop(context)
            )
          ],
        ),
      ),
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: Colors.white),
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reset Password",
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Bla Bla Bla",
                  style: TextStyle(fontSize: 30, color: Colors.purple),
                ),
                SizedBox(height: 60),
                TextField(
                  controller: emailText,
                  decoration: InputDecoration(
                    hintText: "email address",
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue)),
                  ),
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    try {
                      AuthServices.resetPassword(emailText.text);
                      //navigator push
                    } catch (e) {
                      print("gagal");
                    }
                    
                  },
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text("Send Instructions",
                          style: TextStyle(color: Colors.white, fontSize: 25)),
                    )),
                ),
              ],
            ),
          ))),
    );
  }
}