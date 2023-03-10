import 'package:flutter/material.dart';
import 'package:momo_vn/momo_vn.dart';
import 'package:project_threeh/Srceen/Frame_Home.dart';
import 'package:project_threeh/Accouts/Frame_Information.dart';

class Frame_Shop extends StatefulWidget {
  const Frame_Shop({super.key});

  @override
  _Frame_ShopState createState() => _Frame_ShopState();
}

class _Frame_ShopState extends State<Frame_Shop> {
  late MomoVn _momoPay;
  late PaymentResponse _momoPaymentResult;
  // ignore: non_constant_identifier_names
  late String _paymentStatus;
  @override
  void initState() {
    super.initState();
    _momoPay = MomoVn();
    _momoPay.on(MomoVn.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _momoPay.on(MomoVn.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _paymentStatus = "";
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizedBox(
      height: 10,
    );
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
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
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
                                'C??ng Huy',
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'C???a h??ng',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 30, left: 50, right: 20, bottom: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent.withOpacity(0.5),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: size.width / 3,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 6, 245, 125)
                                  .withOpacity(0.5),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '300',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Image.asset('assets/diamond.png',
                                    fit: BoxFit.cover,
                                    width:
                                        MediaQuery.of(context).size.width / 10),
                                Text(
                                  '100.000VN??',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      builder: (context) {
                                        return Container(
                                          height: 200,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text(
                                                'B???n c?? mu???n thanh to??n b???ng MOMO kh??ng?',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('Kh??ng')),
                                                  ElevatedButton(
                                                      onPressed: () async {
                                                        MomoPaymentInfo options = MomoPaymentInfo(
                                                            merchantName:
                                                                "QUIZ THREEH",
                                                            appScheme:
                                                                "MOMOUTHREEH",
                                                            merchantCode:
                                                                'MOMOUTHREEH',
                                                            partnerCode:
                                                                'MOMOUTHREEH',
                                                            amount: 10000,
                                                            orderId: '12321312',
                                                            orderLabel:
                                                                'G??i Kim C????ng',
                                                            merchantNameLabel:
                                                                "Mua g??i kim c????ng",
                                                            fee: 10,
                                                            description:
                                                                'M???t ?????ng kim c????ng s??i sao h???t ???????c',
                                                            username:
                                                                'huyduc@gamil.com',
                                                            partner: 'merchant',
                                                            extra:
                                                                "{\"username\"\"momo\"}",
                                                            isTestMode: true);
                                                        try {
                                                          _momoPay
                                                              .open(options);
                                                        } catch (e) {
                                                          debugPrint(
                                                              e.toString());
                                                        }
                                                      },
                                                      child: Text('Pay MoMo'))
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    "Mua ngay",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width / 3,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 6, 245, 125)
                                  .withOpacity(0.5),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '300',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Image.asset('assets/diamond.png',
                                    fit: BoxFit.cover,
                                    width:
                                        MediaQuery.of(context).size.width / 10),
                                Text(
                                  '100.000VN??',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Mua ngay",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: size.width / 3,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 6, 245, 125)
                                  .withOpacity(0.5),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '300',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Image.asset('assets/diamond.png',
                                    fit: BoxFit.cover,
                                    width:
                                        MediaQuery.of(context).size.width / 10),
                                Text(
                                  '100.000VN??',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Mua ngay",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: size.width / 3,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 6, 245, 125)
                                  .withOpacity(0.5),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '300',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Image.asset('assets/diamond.png',
                                    fit: BoxFit.cover,
                                    width:
                                        MediaQuery.of(context).size.width / 10),
                                Text(
                                  '100.000VN??',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Mua ngay",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)))),
              onPressed: (() => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Frame_Home(),
                      ),
                    )
                  }),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                child: Text(
                  'Quay l???i',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _momoPay.clear();
  }

  void _setState() {
    _paymentStatus = '???? chuy???n thanh to??n';
    if (_momoPaymentResult.isSuccess == true) {
      _paymentStatus += '\nT??nh tr???ng: Th??nh c??ng.';
      _paymentStatus += '\nS??? ??i???n tho???i: ${_momoPaymentResult.phoneNumber}';
      _paymentStatus += '\nExtra: ${_momoPaymentResult.extra!}';
      _paymentStatus += '\nToken: ${_momoPaymentResult.token}';
    } else {
      _paymentStatus += '\nT??nh tr???ng: Th???t b???i.';
      _paymentStatus += '\nExtra: ${_momoPaymentResult.extra}';
      _paymentStatus += '\nM?? l???i: ${_momoPaymentResult.status}';
    }
  }

  void _handlePaymentSuccess(PaymentResponse response) {
    setState(() {
      _momoPaymentResult = response;
      _setState();
    });
  }

  void _handlePaymentError(PaymentResponse response) {
    setState(() {
      _momoPaymentResult = response;
      _setState();
    });
  }
}
