import 'package:flutter/material.dart';
import 'package:intergrationtest/ui/registerScreen.dart';

import 'informationLogin.dart';
import 'package:intergrationtest/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("Auth Test", () {
    testWidgets("Sign Up", (tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(
          find.byKey(const Key("email")), "teset@example.com");
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.enterText(
          find.byKey(const Key("password")), "Coding@1234?");
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.byKey(const Key("login")));
      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
  });
}

class Login extends StatefulWidget {
   const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formkey = GlobalKey();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //لحل مشكلة المسافة في الكيبورد
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          //toolbar
          Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.orange, Colors.deepOrange],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(40))),
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 80),
                  child: Column(
                    children: [
                      Icon(
                        Icons.camera,
                        size: 70,
                        color: Colors.white,
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 20),
                        margin: EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          const SizedBox(
            height: 30,
          ),
          //form
          Container(
              margin: EdgeInsets.all(16),
              child: Form(
                key: _formkey,
                child: Column(children: [
                  Card(

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 10,
                      child: TextFormField(
                        key: Key("email"),
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText: "Email",
                            hintText: 'email',
                            prefixIcon: Icon(Icons.email),
                            //hideline
                            border: InputBorder.none),
                        validator: (value) {
                          if (value!.isEmpty || value == '') {
                            return 'required field';
                          }
                        },
                      )),
                  Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 10,
                      child: TextFormField(
                        controller: password,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText: "Password",
                            hintText: 'passsword',
                            prefixIcon: Icon(Icons.remove_red_eye),
                            //hideline
                            border: InputBorder.none),
                        validator: (value) {
                          if (value!.isEmpty || value == '') {
                            return 'required field';
                          }
                        },
                        //pass star
                        obscureText: true,
                      )),
                ]),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                child: TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder) =>
                      RegisterScreen()));

                }, child: Text('Dont forget password ?',style: TextStyle(color: Colors.black38),)),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
                child: Container(

            margin: EdgeInsets.all(16),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.orange, Colors.deepOrange],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
            child: ElevatedButton(
              key: Key("login"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    ///اذا كانت جميع الحقول صحيحة ينفذ ما بداخل if
                    if(_formkey.currentState!.validate()){
                      Navigator.push(context, MaterialPageRoute(builder: (builder) =>InformationLogin(password: password.text,email: email.text,)
                      )) ;              }
                  },
                  child: Text("Register")),
          ),
              ),
          Expanded(

            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("create Acount?"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (builder) =>RegisterScreen()));

                  }, child: Text('Regester',style: TextStyle(color: Colors.orange),))
                ],
              ),
            ),
          )
        ]));
  }
}
