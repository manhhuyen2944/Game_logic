import 'package:flutter/material.dart';
import 'package:project_threeh/Accouts/Frame_Information.dart';
//import 'package:project_threeh/PlayGame/Frame_Question.dart';
import 'package:project_threeh/Srceen/Frame_Shop.dart';

class Frame_Question_F extends StatefulWidget {
  const Frame_Question_F({super.key});

  @override
  State<Frame_Question_F> createState() => _Frame_Question_FState();
}

class _Frame_Question_FState extends State<Frame_Question_F> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img_10.jpg'),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: Image.asset(
                                  'assets/avatar.png',
                                  width: size.width / 30,
                                  fit: BoxFit.cover,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Frame_Information(),
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, top: 2, bottom: 2),
                                child: Text(
                                  'Công Huy',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
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
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                //height: size.height / 30,
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
                                      child: GestureDetector(
                                        child: Icon(
                                          Icons.add_circle,
                                          color: Colors.green,
                                          size: 20,
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Frame_Shop(),
                                              ));
                                        },
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
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  'ĐIỂM: 0',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
              ),
              Container(
                //margin: EdgeInsets.only(top: 20),
                child: const Text(
                  'Câu hỏi 1:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5, top: 5),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                //height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                    ),
                    color: Colors.black.withOpacity(0.3)),
                child: const Text(
                  'Nhà có 6 anh em, mỗi anh có 3 đứa em gái hỏi nhà có bao nhiêu người?',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Column(
                children: const [
                  Text(
                    'Trợ giúp kháng giả',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 5),
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                    ),
                    color: Colors.yellow.withOpacity(0.3)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 60,
                        left: 50,
                      ),
                      height: MediaQuery.of(context).size.height / 2.8,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.0,
                          ),
                          color: Colors.green.withOpacity(0.8)),
                      child: Text(
                        '30%',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 150,
                        left: 20,
                        right: 5,
                      ),
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.0,
                          ),
                          color: Colors.yellow.withOpacity(0.8)),
                      child: Text(
                        '10%',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 60,
                        left: 20,
                        right: 5,
                      ),
                      height: MediaQuery.of(context).size.height / 2.8,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.0,
                          ),
                          color: Colors.red.withOpacity(0.8)),
                      child: Text(
                        '30%',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 60,
                        left: 20,
                        right: 50,
                      ),
                      height: MediaQuery.of(context).size.height / 2.8,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.0,
                          ),
                          color: Colors.blue.withOpacity(0.8)),
                      child: Text(
                        '30%',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Colors.blue.withOpacity(0.8)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)))),
                onPressed: (() => {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const Frame_Question(),
                      //   ),
                      // )
                    }),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Text(
                    'Xin cảm ơn',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Padding(padding: const EdgeInsets.all(5)),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.redAccent.withOpacity(0.8)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)))),
                          onPressed: (() => {}),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                            child: Icon(Icons.pause_circle_outline_outlined),
                          ),
                        ),
                        Padding(padding: const EdgeInsets.all(5)),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.redAccent.withOpacity(0.3)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)))),
                          onPressed: (() => {}),
                          child: const Padding(
                              padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: Icon(Icons.mobile_friendly_outlined)),
                        ),
                        Padding(padding: const EdgeInsets.all(5)),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.redAccent.withOpacity(0.8)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)))),
                          onPressed: (() => {}),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                            child: Text(
                              '50:50',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(padding: const EdgeInsets.all(5)),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.redAccent.withOpacity(0.8)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)))),
                          onPressed: (() => {}),
                          child: const Padding(
                              padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                              child: Icon(Icons.call_end_sharp)),
                        ),
                        Padding(padding: const EdgeInsets.all(5)),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.blue.withOpacity(0.8)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)))),
                          onPressed: (() => {}),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                            child: Icon(Icons.diamond_outlined),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
