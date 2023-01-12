import 'package:flutter/material.dart';

class Frame_Attack extends StatefulWidget {
  const Frame_Attack({super.key});

  @override
  State<Frame_Attack> createState() => _Frame_AttackState();
}

class _Frame_AttackState extends State<Frame_Attack> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img_8.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 30),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              //height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                  ),
                  color: Colors.black.withOpacity(0.3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          'assets/avatar.png',
                          fit: BoxFit.cover,
                          width: size.width / 6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Công Huy',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.redAccent),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green.withOpacity(0.9),
                      ),
                      width: size.width / 2.5,
                      height: size.width / 15,
                      //color: Colors.red,
                      child: Text(
                        'A. 5 người',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/Attack1.png',
                      fit: BoxFit.cover,
                      width: size.width / 8,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          color: Colors.red,
                          size: 30,
                        ),
                        Text(
                          '10s',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 15,
                              color: Colors.red),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red.withOpacity(0.9),
                      ),
                      width: size.width / 2.5,
                      height: size.width / 15,
                      //color: Colors.red,
                      child: Text(
                        'D. 8 người',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          'assets/avatar.png',
                          fit: BoxFit.cover,
                          width: size.width / 6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Công Huy',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.redAccent),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
