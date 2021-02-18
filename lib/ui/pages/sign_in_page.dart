part of 'pages.dart';

class SignInPage extends StatefulWidget{
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();

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
                  "Wellcome",
                  style: TextStyle(fontSize: 60),
                ),
                Text(
                  "Back",
                  style: TextStyle(fontSize: 60),
                ),
                SizedBox(height: 60),
                TextField(
                  controller: emailText,
                  decoration: InputDecoration(
                    hintText: "Email Addres",
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
                GestureDetector(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text("Forgot Password?",
                        style: TextStyle(color: Colors.purple, fontSize: 20)),
                  ),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ResetPassword();
                    }));
                  },
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    AuthServices.signIn(emailText.text, passwordText.text);
                  },
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text("Sign In",
                          style: TextStyle(color: Colors.white, fontSize: 25)),
                    )),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ",
                        style: TextStyle(color: Colors.grey, fontSize: 20)),
                    GestureDetector(
                      child: Text("Sign Up",
                          style: TextStyle(color: Colors.purple, fontSize: 20)),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUpPage();
                        }));
                      },
                    ),
                  ],
                )
              ],
            ),
          ))),
      // appBar: AppBar(title: Text("Sign In Page")),
      // body: Center(
      //   child: RaisedButton(
      //     child: Text("Sign In"),
      //     onPressed: (){
      //       AuthServices.signIn("nurmadinatulquran@gmail.com", "smkBisa123");
      //     }
      //   )
      // )
    );
  }
}