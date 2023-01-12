import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:project_threeh/Friend/Frame_Friend.dart';

class Frame_Profile extends StatefulWidget {
  const Frame_Profile({super.key});

  @override
  State<Frame_Profile> createState() => _Frame_ProfileState();
}

class _Frame_ProfileState extends State<Frame_Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img_11.png'),
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
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Hồ Sơ Bạn Bè',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 30),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: size.width / 1.5,
                    // height: size.height / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.4),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/avatar1.png',
                                fit: BoxFit.cover,
                                width: size.width / 6,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Text(
                                'Đinh Mạnh Huyên',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 100),
                          child: const Text(
                            'ID: 1234567',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/chart.png',
                                fit: BoxFit.cover,
                                width: size.width / 10,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Xếp hạng: 10',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/up.png',
                                fit: BoxFit.cover,
                                width: size.width / 10,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Cấp độ: 30',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Color.fromARGB(255, 245, 44, 9)
                                                .withOpacity(0.8)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0)))),
                                onPressed: (() => {}),
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Text(
                                    'Xóa bạn',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Color.fromARGB(255, 16, 195, 226)
                                  .withOpacity(0.8)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)))),
                      onPressed: (() => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Frame_Friend(),
                              ),
                            ),
                          }),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Text(
                          'Quay lại',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.cover,
                        width: size.width / 5,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
