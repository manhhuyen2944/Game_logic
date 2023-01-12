import 'package:flutter/material.dart ';

class Frame_Search_Friend extends StatefulWidget {
  const Frame_Search_Friend({super.key});

  @override
  State<Frame_Search_Friend> createState() => _Frame_Search_FriendState();
}

class _Frame_Search_FriendState extends State<Frame_Search_Friend> {
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
                  'Bạn bè',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 30),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width / 3,
                    height: size.height / 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.engineering),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Bạn bè',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 13,
                                  color: Colors.black),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    width: size.width / 2.5,
                    height: size.height / 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.engineering_outlined),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Yêu cầu kết bạn',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 13,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width / 4,
                    height: size.height / 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red.withOpacity(0.4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_sharp),
                        TextButton(
                          child: const Text(
                            'Tìm kiếm',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 13,
                                color: Colors.black),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 1),
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.3),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Tìm kiếm bạn bè',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/avatar1.png',
                            fit: BoxFit.cover,
                            width: size.width / 5,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 30,
                        bottom: 15,
                        left: 40,
                        right: 40,
                      ),
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1.0, color: Colors.black)),
                          border: OutlineInputBorder(),
                          hintText: 'Nhập tên bạn bè của bạn',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll<Color>(
                                    Colors.blue),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(15.0)))),
                        onPressed: (() => {}),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Color.fromARGB(255, 16, 195, 226).withOpacity(0.8)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)))),
                  onPressed: (() => {}),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
