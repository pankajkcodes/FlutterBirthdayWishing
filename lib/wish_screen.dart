import 'dart:async';
import 'dart:math';

import 'package:birthday_wishing/constant.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class WishScreen extends StatefulWidget {
  const WishScreen({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<WishScreen> createState() => _WishScreenState();
}

class _WishScreenState extends State<WishScreen> {
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));

    Timer.periodic(const Duration(seconds: 3), (timer) {
      _controllerCenterRight.play();
      _controllerCenterLeft.play();
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(fit: BoxFit.cover,image: AssetImage("assets/bg1.jpg"))),
          child: Stack(
            children: [
              Container(
                height: AppConstant.height(context) * 0.27,
                width: AppConstant.width(context),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage("assets/bg2.jpg"))),
              ),


              //TOP RIGHT -- Emit left
              Align(
                alignment: Alignment.topRight,
                child: ConfettiWidget(
                  confettiController: _controllerCenterRight,
                  blastDirection: pi,
                  // radial value - LEFT
                  particleDrag: 0.05,
                  // apply drag to the confetti
                  emissionFrequency: 0.05,
                  // how often it should emit
                  numberOfParticles: 20,
                  // number of particles to emit
                  gravity: 0.05,
                  // gravity - or fall speed
                  shouldLoop: false,
                  colors: const [Colors.green, Colors.blue, Colors.pink],
                  // manually specify the colors to be used
                  strokeWidth: 1,
                  strokeColor: Colors.white,
                ),
              ),

              //TOP LEFT - Emit right
              Align(
                alignment: Alignment.topLeft,
                child: ConfettiWidget(
                  confettiController: _controllerCenterLeft,
                  blastDirection: 0,
                  // radial value - RIGHT
                  emissionFrequency: 0.6,
                  minimumSize: const Size(10, 10),
                  // set the minimum potential size for the confetti (width, height)
                  maximumSize: const Size(30, 50),
                  // set the maximum potential size for the confetti (width, height)
                  numberOfParticles: 1,
                  gravity: 0.1,
                ),
              ),
              Positioned(
                top: 121,
                left: 100,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          shadows:  <Shadow>[
                            Shadow(
                              offset: Offset(1.0, 2.0),
                              blurRadius: 5.0,
                              color: Colors.red,
                            ),
                            Shadow(
                              offset: Offset(1.0, 2.0),
                              blurRadius: 8.0,
                              color: Colors.white,
                            ),
                          ],
                          color: Colors.tealAccent),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
