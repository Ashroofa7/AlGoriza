import 'package:algoriza_task_1/home/home_screen.dart';
import 'package:algoriza_task_1/signup_screen/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Login_Screen extends StatelessWidget {
  Login_Screen({Key? key}) : super(key: key);
  var formkey = GlobalKey<FormState>();
  var phone = TextEditingController();

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
                  height: 300,
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
                          'Sign in',
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
                                'Help', style: TextStyle(
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
                      controller:phone,
                     invalidNumberMessage:'Number Must Not Be Empty or Not Valid' ,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        color: Colors.cyanAccent.shade700,
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              Navigator.pushAndRemoveUntil(
                                  context, MaterialPageRoute(
                                  builder: (context) => Home_Screen()),
                                      (Route <dynamic> route) => false);
                            }
                          },
                          child: const Text('Login', style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an acount?', style: TextStyle(
                            fontSize: 20,
                          ),),
                          TextButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Signup_Screen(),),);
                          }, child: const Text('Sign up', style: TextStyle(
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
