import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/material.dart';

class Frame_Lose extends StatefulWidget {
  const Frame_Lose({super.key});

  @override
  State<Frame_Lose> createState() => _Frame_LoseState();
}

class _Frame_LoseState extends State<Frame_Lose> {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: 2,
                            left: 1,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/avatar.png',
                                width: size.width / 30,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                'Công Huy',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 150, 223, 137),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Level',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            '12/30',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 232, 16, 16),
                              fontSize: 15,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 150, 223, 137),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/diamond.png',
                                width: size.width / 30,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  '100',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Image.asset(
                                  'assets/add.png',
                                  fit: BoxFit.cover,
                                  width: size.width / 20,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    margin: EdgeInsets.only(bottom: 5, top: 5),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    //height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.0,
                        ),
                        color: Colors.white.withOpacity(0.3)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'You Lose',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                                color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/avatar.png',
                            fit: BoxFit.cover,
                            width: size.width / 3,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Công Huy',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.red),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 35),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.yellow.withOpacity(0.6),
                          ),
                          width: size.width / 4,
                          height: size.width / 25,
                          //color: Colors.red,
                          child: Text(
                            '7/10',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Colors.red),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0)))),
                                onPressed: (() => {}),
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                  child: Text(
                                    'Thoát',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Colors.green),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0)))),
                                onPressed: (() => {}),
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Text(
                                    'Chơi tiếp',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
