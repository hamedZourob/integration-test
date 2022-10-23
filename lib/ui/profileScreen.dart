import 'package:flutter/material.dart';
class ProfileScreen extends StatefulWidget {
  ///لارسال البيانات استخدام طريقة constractor
   String userName;
   String password;
   String phone;
   String email;
   ProfileScreen({Key? key,required this.userName,required this.phone,required this.password,required this.email}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:  Text("profile",style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),centerTitle: true,),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  ///استخدام كلمة wedget  للوصول الى المتغيرات من كلاس الاساسي
                Text('name :${widget.userName},',style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                Text('password :${widget.password}',style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
                Text('email :${widget.email}',style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
                Text('phone :${widget.phone}',style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
              ],
            ),
          ),
    );
  }
}
