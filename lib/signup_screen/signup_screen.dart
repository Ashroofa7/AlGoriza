import 'package:algoriza_task_1/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../login_screen/login_screen.dart';

class Signup_Screen extends StatefulWidget {
  Signup_Screen({Key? key}) : super(key: key);

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  var formkey = GlobalKey<FormState>();

  var text= TextEditingController();

  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Card(
                child: SvgPicture.asset(
                  'assets/images/board_4.svg',
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                ),
                elevation: 0,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome to First Task',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Sign up',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                'Help',style: TextStyle(
                                color: Colors.cyan,
                              ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Align(
                                child: Icon(
                                  Icons.person_pin_circle_outlined,
                                  color: Colors.grey,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    IntlPhoneField(
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',

                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'EG',
                      invalidNumberMessage:'Number Must Not Be Empty or Not Valid' ,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: text,
                      keyboardType: TextInputType.text,
                      obscureText: isShow?false:true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            isShow= !isShow;
                          });
                        },icon: Icon(isShow?Icons.visibility_off:Icons.visibility),),
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      validator: (s){
                        if(s!.isEmpty){
                          return'Password Must Not Be Empty!!';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                          color:Colors.cyanAccent.shade700,
                          width: double.infinity,
                          child: MaterialButton(
                            onPressed: () {
                              if(formkey.currentState!.validate()){
                                Navigator.pushAndRemoveUntil(
                                    context, MaterialPageRoute(builder: (context) => Home_Screen()),
                                        (Route <dynamic> route) => false);
                              }
                            },
                            child: const Text('Sign UP',style: TextStyle(
                                color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),),
                          )),
                    ),
                    Container(

                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Have any acount?', style: TextStyle(
                            fontSize: 20,
                          ),),
                          TextButton(onPressed: () {


                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Login_Screen(),),);
                          }, child: const Text('Login', style: TextStyle(
                            fontSize: 20,
                              color: Colors.cyan,
                          ),),),
                        ],),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
