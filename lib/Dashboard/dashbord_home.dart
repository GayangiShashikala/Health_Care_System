import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({Key? key}) : super(key: key);

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.teal.shade50,
        color: Colors.teal.shade200,
        animationDuration: Duration(microseconds: 500),
        onTap: (index){
          print(index);
        },
        items: const [
          Icon(Icons.home,color: Colors.white),
          Icon(Icons.chat_bubble,color: Colors.white,),
          Icon(Icons.settings,color: Colors.white,),
        ],
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Signed In as:' + user.email!),
              MaterialButton(onPressed: (){
                FirebaseAuth.instance.signOut();
              },
                color: Colors.deepPurple[200],
                child: Text('Sign Out'),
              )
            ],
          )),
    );
  }
}
