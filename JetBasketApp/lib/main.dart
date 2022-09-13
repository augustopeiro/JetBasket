import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_application_1/Pagamento.dart';
import 'package:flutter_application_1/Paypal.dart';
import 'package:flutter_application_1/Pix.dart';
import 'package:flutter_application_1/Whatsapp.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'Carrinho.dart';
import 'Home_Page.dart';
import 'Login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Get.off(Login());
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.purple),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                //height: 200,
                //width: 500,
                child: Lottie.asset("assets/basket6.json")),
            Text("Jet Basket",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold)),
            Text("-- A compra mais rápida das galáxias --", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}















// void main() => runApp(SplashScreen());

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();

// }

// class _SplashScreenState extends State<SplashScreen> {

//   @override

//   void initState(){
//     super.initState();
//     Timer(Duration(seconds: 2),(){
//       Get.off(Login());
//     });
//   }

//   // void initState(){
//   //   super.initState();
//   //   Timer(Duration(seconds: 2),(){
//   //     Get.off(Carrinho());
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp( 
//       home: Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(color: Colors.orange),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
                                           
//                          Icon(
//                           Icons.shopping_basket_rounded,
//                           color: Colors.purple,
//                           size: 200.0,
//                           ),

//                         Padding(
//                           padding: EdgeInsets.only(top: 10.0),
//                         ),
//                         Text(
//                           "Jet Basket",style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
//                         )
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     CircularProgressIndicator(
//                       color: Colors.purple,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(top: 20.0),
//                   ),
//                   Text("--- A compra mais rápida das galáxias ---", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold)),
//                 ],
//               )
//               )
//           ],)
//         ],
//       ),
//     ));
//   }
// }




// void main() => runApp(MyApp());


// class MyApp extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'JetBasket App',
//       home: AnimatedSplashScreen(
//         splash: Image.asset(
//           'imagens/cesta.png'
//         ),
//         nextScreen: Login(),
//         splashTransition: SplashTransition.decoratedBoxTransition,
//         backgroundColor: Colors.purple,
//         splashIconSize: 200,
//         duration: 3000,

//       ),
//     );
//   }
// }


