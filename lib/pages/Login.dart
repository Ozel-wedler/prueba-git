import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  TextStyle _style = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  late AnimationController _controllerRight;
  Animation? right;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerRight =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    right = Tween(begin: 0, end: 20).animate(_controllerRight);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF5EEEB),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.2,
          ),
          const Hero(
            tag: "icon",
            child: Icon(
              Icons.diamond,
              size: 60,
            ),
          ),
          Text(
            "SmartBank",
            style: _style,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            width: size.width * 0.8,
            height: size.height * 0.07,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: const TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Email/Phone number"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: size.width * 0.8,
            height: size.height * 0.07,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Password"),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Forgot password?"),
              SizedBox(
                width: size.width * 0.1,
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                      horizontal: size.width * 0.33,
                      vertical: size.height * 0.02)),
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {},
              child: const Text(
                "LOG IN",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              )),
          Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "home"),
            child: Text(
              "ORDER A CARD",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.4)),
            ),
          ),
          SizedBox(
            height: size.height * 0.08,
          )
        ],
      ),
    );
  }
}
