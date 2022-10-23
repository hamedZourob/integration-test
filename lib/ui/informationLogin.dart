import 'package:flutter/material.dart';
class InformationLogin extends StatefulWidget {
  String password,email;
   InformationLogin({Key? key,required this.password,required this.email}) : super(key: key);

  @override
  State<InformationLogin> createState() => _InformationLoginState();
}

class _InformationLoginState extends State<InformationLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("information Login",style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),centerTitle: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///استخدام كلمة wedget  للوصول الى المتغيرات من كلاس الاساسي
            Text('email :${widget.email}',style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
            Text('password :${widget.password}',style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
          ],
        ),
      ),
    );  }
}
