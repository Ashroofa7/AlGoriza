import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../login_screen/login_screen.dart';
import '../signup_screen/signup_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  List<Boardingmodel> model = [
    Boardingmodel(
      image: 'assets/images/board_1.svg',
      head: 'First Page',
      body: 'First Page',
    ),
    Boardingmodel(
      image: 'assets/images/board_2.svg',
      head: 'Second Page',
      body: 'Second Page',
    ),
    Boardingmodel(
      image: 'assets/images/board_3.svg',
      head: 'Third Page',
      body: 'Third Page',
    ),
    Boardingmodel(
      image: 'assets/images/board_4.svg',
      head: 'Fourth Page',
      body: 'Fourth Page',
    ),
  ];

  bool islast = false;
  var pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(


        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

                decoration: BoxDecoration(
                  color: Colors.cyanAccent.shade700,
                  borderRadius: BorderRadius.circular(15),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,

                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context, MaterialPageRoute(builder: (context) => Login_Screen()),
                            (route) => false);
                  },
                  child: const Text('Skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),),
                )),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: PageView.builder(
                      controller: pagecontroller,
                      onPageChanged: (index){
                        if( index == model.length-1)
                          {
                            setState(() {
                              islast=true;
                            });
                          }else{
                          setState(() {
                            islast = false;
                          });
                        }
                      },
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildOnboard(model[index],context),
                      itemCount: model.length),
                ),
                Image.asset('assets/images/logo0.jpg',
                ),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: pagecontroller,
            effect: const ExpandingDotsEffect(
              radius: 10,
              dotColor: Colors.grey,
              dotWidth: 10,
              dotHeight: 10,
              activeDotColor: Colors.deepPurple,
              spacing: 5,
              expansionFactor: 5,
            ),
            count: model.length,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.cyanAccent.shade700,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    if(islast){
                      Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(builder: (context) => Login_Screen()),
                              (Route <dynamic> route) => false);
                    }else {
                      pagecontroller.nextPage(duration: const Duration(
                        milliseconds: 700,
                      ), curve: Curves.fastOutSlowIn,);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:const [
                       Text('Next', style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: .0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Dont\' have an account?', style: TextStyle(
                  fontSize: 18,
                ),),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Signup_Screen(),),);
                }, child: Text('Sign Up',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.cyanAccent.shade700),),)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Boardingmodel {
  final String image;
  final String head;
  final String body;

  Boardingmodel({
    required this.image,
    required this.head,
    required this.body,
  });
}

Widget buildOnboard(Boardingmodel model,context) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SvgPicture.asset(
              model.image,
              height: MediaQuery.of(context).size.height *0.4,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              model.head,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              model.body,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
