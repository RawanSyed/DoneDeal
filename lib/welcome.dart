import 'package:donedeal/do_list.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "DoneDeal",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                  color: Color.fromARGB(255, 107, 139, 211)),
            ),
            Lottie.asset('animation/welcom.json', height: 375),
            Text("Welcome to DoneDeal",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                  color: Colors.black,
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                    "DoneDeal will helps you to stay orgnaized and perform your tasks much faster",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Pacifico",
                      color: Colors.grey,
                    )),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => do_list()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 107, 139, 211),
                    fixedSize: Size(300, 60)),
                child: Text(
                  "Get started",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Pacifico",
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
