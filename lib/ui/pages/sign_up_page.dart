part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  TextEditingController numberPhoneText = TextEditingController();

  void notif() {
    int count = 0;

    AlertDialog alertDialog = AlertDialog(
      content: Container(
        height: 100.0,
        child: Column(
          children: [
            Text("Registrasi Berhasil"),
            RaisedButton(
                child: Text("OK"),
                onPressed: () =>
                    Navigator.of(context).popUntil((_) => count++ >= 2))
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
                  "Hello!",
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Signup to",
                  style: TextStyle(fontSize: 60),
                ),
                Text(
                  "Get started",
                  style: TextStyle(fontSize: 60),
                ),
                SizedBox(height: 60),
                TextField(
                  controller: usernameText,
                  decoration: InputDecoration(
                    hintText: "Username",
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue)),
                  ),
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passwordText,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.blue)),
                  ),
                  style: TextStyle(fontSize: 25),
                  obscureText: true,
                ),
                SizedBox(height: 20),
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
                TextField(
                  controller: numberPhoneText,
                  decoration: InputDecoration(
                    hintText: "Number Phone",
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
                  onTap: () async {
                    SignInSignUpResult result = await AuthServices.signUp(
                        emailText.text,
                        passwordText.text,
                        usernameText.text,
                        numberPhoneText.text);

                    if (result.user == null) {
                      print(result.massage);
                    } else {
                      notif();
                      print(result.user.toString());
                    }
                  },
                  child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("Sign Up",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                      )),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ",
                        style: TextStyle(color: Colors.grey, fontSize: 20)),
                    GestureDetector(
                      child: Text("Sign In",
                          style: TextStyle(color: Colors.purple, fontSize: 20)),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignInPage();
                        }));
                      },
                    ),
                  ],
                )
              ],
            ),
          ))),
    );
  }
}
