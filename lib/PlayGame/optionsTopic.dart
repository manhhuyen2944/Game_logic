// import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:project_threeh/PlayGame/frame_level.dart';
import 'package:project_threeh/Srceen/Frame_Home.dart';
//import 'package:project_threeh/Srceen/Frame_Shop.dart';

class OptionTopic extends StatefulWidget {
  const OptionTopic({super.key});

  @override
  State<OptionTopic> createState() => _OptionTopicState();
}

//Future<bool?> showWarning(BuildContext context)async =>showDialog(context: context, builder: builder)
class _OptionTopicState extends State<OptionTopic> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Frame_Home(),
                ));
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img_6.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.25,
                //height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(40),
                    color: Color.fromARGB(255, 119, 108, 3)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Địa lí',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        Image.asset(
                          'assets/dialy.gif',
                          fit: BoxFit.cover,
                          width: size.width / 3,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.orange.withOpacity(0.8)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => frame_level(topic: 1),
                              ));
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Text(
                            'Chơi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.25,
                //height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(40),
                    color: Color.fromARGB(255, 3, 65, 5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Lịch sử',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        Image.asset(
                          'assets/lichsu.gif',
                          fit: BoxFit.cover,
                          width: size.width / 3,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.orange.withOpacity(0.8)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => frame_level(
                                  topic: 2,
                                ),
                              ));
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Text(
                            'Chơi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.25,
                //height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.pinkAccent),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Sinh học',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        Image.asset(
                          'assets/sinhhoc.gif',
                          fit: BoxFit.cover,
                          width: size.width / 3,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.orange.withOpacity(0.8)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => frame_level(
                                  topic: 3,
                                ),
                              ));
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Text(
                            'Chơi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.25,
                //height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(40),
                    color: Color.fromARGB(255, 2, 32, 57)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Toán học',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        Image.asset(
                          'assets/toan.gif',
                          fit: BoxFit.cover,
                          width: size.width / 3,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.orange.withOpacity(0.8)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                      'Đang cập nhật dữ liệu vui lòng quay lại sau'),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('OK'))
                                  ],
                                );
                              });
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Text(
                            'Chơi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.25,
                //height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(40),
                    color: Color.fromARGB(255, 80, 49, 3)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Vật lý',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        Image.asset(
                          'assets/vatly.gif',
                          fit: BoxFit.cover,
                          width: size.width / 3,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.orange.withOpacity(0.8)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                      'Đang cập nhật dữ liệu vui lòng quay lại sau'),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('OK'))
                                  ],
                                );
                              });
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Text(
                            'Chơi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.25,
                //height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(40),
                    color: Color.fromARGB(255, 66, 35, 35)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Hóa học',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        Image.asset(
                          'assets/hoahoc.gif',
                          fit: BoxFit.cover,
                          width: size.width / 4,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.orange.withOpacity(0.8)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                      'Đang cập nhật dữ liệu vui lòng quay lại sau'),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('OK'))
                                  ],
                                );
                              });
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Text(
                            'Chơi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.25,
                //height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(40),
                    color: Color.fromARGB(255, 57, 20, 12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Ngữ văn',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        Image.asset(
                          'assets/nguvan.gif',
                          fit: BoxFit.cover,
                          width: size.width / 3,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.orange.withOpacity(0.8)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                      'Đang cập nhật dữ liệu vui lòng quay lại sau'),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('OK'))
                                  ],
                                );
                              });
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Text(
                            'Chơi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.25,
                //height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(40),
                    color: Color.fromARGB(255, 100, 2, 2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'IT',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        Image.asset(
                          'assets/cntt.gif',
                          fit: BoxFit.cover,
                          width: size.width / 3,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.orange.withOpacity(0.8)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                      'Đang cập nhật dữ liệu vui lòng quay lại sau'),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('OK'))
                                  ],
                                );
                              });
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Text(
                            'Chơi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.25,
                //height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(40),
                    color: Color.fromARGB(255, 63, 4, 61)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Khoa học',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        Image.asset(
                          'assets/khoahoc.gif',
                          fit: BoxFit.cover,
                          width: size.width / 3,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.orange.withOpacity(0.8)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                      'Đang cập nhật dữ liệu vui lòng quay lại sau'),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('OK'))
                                  ],
                                );
                              });
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Text(
                            'Chơi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.25,
                //height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(40),
                    color: Color.fromARGB(255, 3, 46, 60)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Tiếng anh',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        Image.asset(
                          'assets/tienganh.gif',
                          fit: BoxFit.cover,
                          width: size.width / 3,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.orange.withOpacity(0.8)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                      'Đang cập nhật dữ liệu vui lòng quay lại sau'),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('OK'))
                                  ],
                                );
                              });
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Text(
                            'Chơi',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
