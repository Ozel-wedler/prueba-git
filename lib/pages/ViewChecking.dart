import 'dart:ui';

import 'package:cashflow/model/User.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ViewChecking extends StatefulWidget {
  const ViewChecking({Key? key}) : super(key: key);

  @override
  State<ViewChecking> createState() => _ViewCheckingState();
}

class _ViewCheckingState extends State<ViewChecking>
    with TickerProviderStateMixin {
  Animation<double>? _rotate;
  AnimationController? _animationController;
  AnimationController? _animationController2;
  bool stateValueAnimation = false;
  Animation<double>? _scale;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController2 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _rotate = Tween(begin: 0.0, end: 4 * pi).animate(CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeIn,
    ));
    _scale = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController2!, curve: Curves.easeIn));
    _animationController!.addListener(() {
      print(_animationController!.status);
    });
    _animationController!.addStatusListener((status) {
      print(status);

      if (status == AnimationStatus.completed) {
        setState(() {
          stateValueAnimation = true;
          _animationController2!.forward();
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController!.dispose();
    _animationController2!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String?> user =
        ModalRoute.of(context)!.settings.arguments as List<String?>;
    _animationController!.forward();
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        fondoblur(size),
        Container(
          width: size.width,
          height: size.height,
          color: Colors.grey.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * (stateValueAnimation == true ? 0.3 : 0.2),
              ),
              stateValueAnimation == true
                  ? AnimatedBuilder(
                      animation: _animationController2!,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _scale!.value,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              Icons.check,
                              size: 60,
                              color: Colors.blue,
                            ),
                          ),
                        );
                      },
                    )
                  : Hero(
                      transitionOnUserGestures: true,
                      tag: user[2]!,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(user[3]!),
                        radius: 50,
                      ),
                    ),
              SizedBox(
                height: 10,
              ),
              Hero(
                tag: user[0]!,
                child: Text(
                  user[0]!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Hero(
                tag: user[1]!,
                child: Text(
                  user[1]!,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                user[4]! + ".00",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text("Transfering funds",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Spacer(),
              stateValueAnimation == true
                  ? Container()
                  : TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shadowColor: MaterialStateProperty.all(Colors.black),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 18)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      child: Text("cancel Transfer",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
              SizedBox(
                height: 40,
              )
            ],
          ),
        )
      ],
    ));
  }

  fondoblur(Size size) {
    return ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 25.0),
        child: fondo(size) // Widget that is blurred
        );
  }

  fondo(Size size) {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.white,
      child: AnimatedBuilder(
          animation: _animationController!,
          builder: (context, snapshot) {
            return Transform.rotate(
              angle: _rotate!.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: size.height * 0.5,
                    child: Stack(
                      children: [
                        Positioned(
                          top: size.height * 0.2,
                          left: size.width * 0.25,
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.05,
                          left: size.width * 0.4,
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        ),
                        Positioned(
                          right: size.width * 0.44,
                          top: size.height * 0.05,
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
//  Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Hero(
//                   transitionOnUserGestures: true,
//                   tag: user.phone!,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     backgroundImage: NetworkImage(user.picture!),
//                     radius: 50,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Hero(
//                   tag: user.name!,
//                   child: Text(
//                     user.name!,
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                 ),
//                 Hero(
//                   tag: user.email!,
//                   child: Text(
//                     user.email!,
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),