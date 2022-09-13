import 'package:flutter/material.dart';
import 'package:flutter_application_1/Sobre.dart';
import 'package:lottie/lottie.dart';
import 'CadastroPage1.dart';
import 'Carrinho.dart';
import 'Logout.dart';
import 'Sobre.dart';
import 'FaleConosco.dart';
import 'CadastroPage2.dart';


class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  

  Widget build(BuildContext context) {
    return Drawer(
      
      backgroundColor: Colors.orange,   
       child: Center(child: ListView(
        children: [
          UserAccountsDrawerHeader(    
            
            accountName: Text('JetBasket'),
            accountEmail: Text('Decolando!'),
            currentAccountPicture: CircleAvatar(     
                backgroundColor: Colors.purple,
                child: Lottie.asset("assets/rocket2.json")                  
            ),
            decoration: BoxDecoration(               
              color: Colors.purple,                          
            ),
          ),
          SizedBox(height: 15),
          ListTile (
            title: Text('Sobre a Jet Basket', style: TextStyle(color: Colors.white)),
            tileColor: Colors.purple,             
            onTap: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => Sobre()));
              },
          ),
          SizedBox(height: 15),
          ListTile (
            title: Text('Fale Conosco', style: TextStyle(color: Colors.white)),
            tileColor: Colors.purple,            
            onTap: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => FaleConosco()));
            },
          ),
          SizedBox(height: 15),
          ListTile (
            title: Text('Sair', style: TextStyle(color: Colors.white)),
            tileColor: Colors.purple,            
            onTap: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => Logout()));
            },
          ),
          SizedBox(height: 15),
          Divider(color: Colors.purple),
          SizedBox(height: 15),
           Icon(
                Icons.shopping_basket_rounded,
                color: Colors.purple,
                size: 150.0,
                ),
            SizedBox(height: 15),
                // Text(
                //       "Jet Basket",style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
                //     )
        ],
      ),
      ),
    );
  }
}
