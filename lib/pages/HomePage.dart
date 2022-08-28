import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TextStyle _style = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  TextStyle _style2 = TextStyle(fontSize: 18, color: Colors.grey);
  AnimationController? _controllerRight;
  AnimationController? _controllerRight2;
  Animation<double>? right;
  Animation<double>? right2;
  Animation<double>? _opacity;
  Animation<double>? _bottom;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerRight =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controllerRight2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));

    right = Tween(begin: 200.0, end: 0.0).animate(
        CurvedAnimation(parent: _controllerRight!, curve: Curves.easeInBack));
    right2 = Tween(begin: 200.0, end: 0.0).animate(
        CurvedAnimation(parent: _controllerRight2!, curve: Curves.easeInBack));
    _opacity = Tween(begin: 0.2, end: 1.0).animate(
        CurvedAnimation(parent: _controllerRight!, curve: Curves.easeInBack));
    _bottom = Tween(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(parent: _controllerRight!, curve: Curves.easeInBack));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _controllerRight2!.forward();
    _controllerRight!.forward();
    return Scaffold(
      backgroundColor: const Color(0xffF5EEEB),
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.3,
                ),
                const Hero(
                  tag: "icon",
                  child: Icon(
                    Icons.diamond,
                    size: 60,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Welcome",
                  style: _style,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "to SmartBank",
                  style: _style,
                ),
                SizedBox(
                  height: 30,
                ),
                AnimatedBuilder(
                  animation: _controllerRight!,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0.0, _bottom!.value),
                      child: Text(
                        "receive the required information on",
                        style: _style2,
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _controllerRight!,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0.0, _bottom!.value),
                      child: Text(
                        "your finances.",
                        style: _style2,
                      ),
                    );
                  },
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        AnimatedBuilder(
                          animation: _controllerRight!,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(right!.value, 0.0),
                              child: Opacity(
                                opacity: _opacity!.value,
                                child: TextButton(
                                    style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(
                                                horizontal: size.width * 0.38,
                                                vertical: size.height * 0.02)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        side: MaterialStateProperty.all(
                                            const BorderSide(
                                                color: Colors.black))),
                                    onPressed: () =>
                                        Navigator.pushNamed(context, "login"),
                                    child: const Text(
                                      "LOG IN",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        AnimatedBuilder(
                          animation: _controllerRight2!,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(right2!.value, 0.0),
                              child: Opacity(
                                opacity: _opacity!.value,
                                child: TextButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(
                                                horizontal: size.width * 0.3,
                                                vertical: size.height * 0.02)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black)),
                                    onPressed: () {},
                                    child: const Text(
                                      "ORDER A CARD",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.08,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
