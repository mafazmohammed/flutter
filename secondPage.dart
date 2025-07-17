import 'package:flutter/material.dart';

class MySecondPage extends StatelessWidget {
  const MySecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 420,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 100,
                    width: 100,

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/eng-photo.jpg'),
                      ),
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                SizedBox(height: 30),
                Text(
                  'Lana Smith',
                  style: TextStyle(fontFamily: 'Impact', fontSize: 40),
                ),
                SizedBox(height: 5),
                Text(
                  'Engineer',
                  style: TextStyle(fontFamily: 'anton', fontSize: 25),
                ),
                SizedBox(height: 10),
                Text(
                  'Most important game in this life , \n is achieving your goals',
                  textAlign: TextAlign.center,

                  style: TextStyle(fontFamily: 'Bebas Neue'),
                ),
                SizedBox(height: 55),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/Logo-design.jpeg'),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 350,
                            offset: Offset(0, -3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
