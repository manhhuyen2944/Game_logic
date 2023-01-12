//import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_threeh/Accouts/Frame_Login.dart';
import 'package:project_threeh/frame_manhinhcho.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

import 'package:volume_controller/volume_controller.dart';

class Frame_Setting extends StatefulWidget {
  Frame_Setting({super.key});

  @override
  State<Frame_Setting> createState() => _Frame_SettingState();
}

class _Frame_SettingState extends State<Frame_Setting> {
  double _volumeListenerValue = 0;

  double _setVolumeValue = 0;

  @override
  void initState() {
    super.initState();
    // Listen to system volume change
    VolumeController().listener((volume) {
      setState(() => _volumeListenerValue = volume);
    });

    VolumeController().getVolume().then((volume) => _setVolumeValue = volume);
  }

  @override
  void dispose() {
    VolumeController().removeListener();
    super.dispose();
  }

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
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Cài đặt',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red, fontSize: 40),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 50),
            child: Icon(
              Icons.settings,
              size: 60,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Voice.png',
                    fit: BoxFit.cover,
                    width: size.width / 12,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nhạc nền',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25),
                    ),
                  ),
                  Flexible(
                    child: Slider(
                      min: 0,
                      max: 1,
                      onChanged: (double value) {
                        _setVolumeValue = value;
                        VolumeController().setVolume(_setVolumeValue);
                        setState(() {});
                      },
                      value: _setVolumeValue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(15.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Image.asset(
          //         'assets/chuong.png',
          //         fit: BoxFit.cover,
          //         width: size.width / 12,
          //         color: Colors.white,
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Text(
          //           'Âm thanh',
          //           style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               color: Colors.white,
          //               fontSize: 25),
          //         ),
          //       ),
          //       Flexible(
          //         child: Slider(
          //           min: 0,
          //           max: 1,
          //           onChanged: (double value) {
          //             // setState(() {
          //             _setVolumeValue1 = value;

          //             VolumeController().setVolume(_setVolumeValue1);
          //             // });
          //           },
          //           value: _setVolumeValue1,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 16, 195, 226).withOpacity(0.8)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)))),
              onPressed: (() => {Navigator.of(context).pop()}),
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
      )),
    ));
  }
}
