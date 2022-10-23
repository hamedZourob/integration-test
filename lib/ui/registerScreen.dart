import 'package:flutter/material.dart';
import 'package:intergrationtest/ui/profileScreen.dart';

import '../constants-keys/const_keys.dart';
import 'loginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  /// للتحقق من الحقول
  final GlobalKey<FormState> _formkey =GlobalKey();
  TextEditingController name =TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController phone =TextEditingController();
  TextEditingController password =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //لحل مشكلة المسافة في الكيبورد
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        //toolbar
        Container(
            height: MediaQuery.of(context).size.height * 0.25,
            decoration:const BoxDecoration(
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
                          "Register",
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
                child: Column(
              children: [
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 10,
                    child: TextFormField(
                      key: ConstKey.Name,
                      controller: name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          labelText: "User Name",
                          hintText: 'user name',
                          prefixIcon: Icon(Icons.person),
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
                      key: ConstKey.Email,
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
                      //pass star
                    )),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 10,
                    child: TextFormField(
                      key: ConstKey.Password,
                      controller: password,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(

                          labelText: "Password",
                          hintText: 'password',
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
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 10,
                    child: TextFormField(
                      key: ConstKey.Phone,
                      keyboardType: TextInputType.number,
                      controller: phone,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          labelText: "phone",
                          hintText: 'phone',
                          prefixIcon: Icon(Icons.phone),
                          //hideline
                          border: InputBorder.none),
                      validator: (value) {
                        if (value!.isEmpty || value == '') {
                          return 'required field';
                        }
                      },
                    ))
              ],
            ))),
        //buttom Regester
        Container(
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
            key: ConstKey.SignUp,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent),
              onPressed: () {
                ///اذا كانت جميع الحقول صحيحة ينفذ ما بداخل if
                if(_formkey.currentState!.validate()){
                  Navigator.push(context, MaterialPageRoute(builder: (builder) =>ProfileScreen(userName: name.text,password: password.text,phone: phone.text,email: email.text,)
                  )) ;              }
              },
              child: Text("Register")),
        ),
        Expanded(

          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("has Acount?"),
                TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (builder) =>Login()));}, child: Text('Login',style: TextStyle(color: Colors.orange),))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
