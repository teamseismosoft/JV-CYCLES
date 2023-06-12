import 'package:flutter/material.dart';
import 'package:jv_cycles/services/distanceCal.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String Lat = '0', Lng = '0';

  getLocation() async {
    Location().getCurrentLocation().then((value) => {
          setState(() {
            Lat = value!.latitude.toString();
            Lng = value.longitude.toString();
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              Text(
                'Lat : $Lat',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Lng : $Lng',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ElevatedButton(
                onPressed: getLocation,
                child: const Text(
                  'Get Location',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
