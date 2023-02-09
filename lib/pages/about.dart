import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    const String description =
        'JV Cycles is a premier cycle showroom dedicated to providing cyclists with the latest and greatest in bicycles and cycling gear. Our showroom features an extensive selection of road bikes, mountain bikes, hybrid bikes, and more, from top brands in the industry. Our knowledgeable staff is on hand to assist you in finding the perfect bike to suit your needs and budget. In addition to bikes, we offer a wide range of cycling accessories, parts, and gear, as well as expert repair and maintenance services.\nJV Cycles is not just a cycle showroom, but a one-stop-shop for all your cycling needs. In addition to an extensive selection of bikes, we also offer the latest and greatest in fitness gadgets to enhance your riding experience. From heart rate monitors to power meters, we have everything you need to track your progress and reach your fitness goals. Whether you\'re a seasoned cyclist or just starting out, our knowledgeable staff is here to help you find the perfect gadgets to match your needs and budget. Come visit JV Cycles and elevate your cycling game today!';

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(children: const [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: SizedBox(
              height: 200,
              child: Image(
                image: AssetImage('assets/LOGO.png'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'J V CYCLES',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(14),
            child: Text(
              description,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        ]),
      ),
    ));
  }
}
    
    
    
//     Container(
//       color: Colors.white,
//       child: Column(children: const [
//         SizedBox(
//           height: 40,
//         ),
//         Padding(
//           padding: EdgeInsets.all(12),
//           child: SizedBox(
//             height: 200,
//             child: Image(
//               image: AssetImage('assets/LOGO.png'),
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(vertical: 12),
//           child: Text(
//             'J V CYCLES',
//             style: TextStyle(
//               fontSize: 26,
//               fontWeight: FontWeight.w900,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(14),
//           child: Text(
//             description,
//             style: TextStyle(fontSize: 12, color: Colors.black),
//           ),
//         ),
//       ]),
//     );
//   }
// }
