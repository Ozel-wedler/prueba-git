import 'package:cashflow/model/User.dart';
import 'package:flutter/material.dart';

class ViewTransation extends StatefulWidget {
  const ViewTransation({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewTransation> createState() => _ViewTransationState();
}

class _ViewTransationState extends State<ViewTransation>
    with TickerProviderStateMixin {
  List<dynamic> word = [
    const Text("1",
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20)),
    const Text("2",
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20)),
    const Text("3",
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20)),
    const Text("4",
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20)),
    const Text("5",
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20)),
    const Text("6",
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20)),
    const Text("7",
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20)),
    const Text("8",
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20)),
    const Text("9",
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20)),
    const Text(".",
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20)),
    const Text("0",
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20)),
    const Text("<-",
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20)),
  ];

  String value = "\$";
  List<String> value2 = ["\$"];

  AnimationController? _controller;
  Animation<double>? _opacity;
  Animation<double>? _scale;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _opacity = Tween(begin: 0.4, end: 1.0)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.easeIn));
    _scale = Tween(begin: 0.8, end: 1.0)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;
    final size = MediaQuery.of(context).size;
    _controller!.forward();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close),
            color: Colors.black,
          ),
          title: Text(
            "Enter Amount",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Hero(
                  tag: user.phone!,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(user.picture!),
                    radius: 50,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Hero(
                  tag: user.name!,
                  child: Text(
                    user.name!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Hero(
                  tag: user.email!,
                  child: Text(
                    user.email!,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AnimatedBuilder(
                  animation: _controller!,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scale!.value,
                      child: Opacity(
                        opacity: _opacity!.value,
                        child: Text(
                          value.isEmpty ? "\$0" : value2.join(),
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.4,
                  child: Center(
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      addRepaintBoundaries: false,
                      itemCount: word.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1.8,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Text t = word[index];

                            setState(() {
                              _controller!.repeat();

                              if (t.data! == "<-") {
                                if (value2.length > 1) {
                                  value2.removeLast();
                                }
                              } else {
                                value2.add(t.data!);
                              }
                            });
                          },
                          child: Container(
                            child: Center(
                              child: word[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Spacer(),
                TextButton(
                    onPressed: () => Navigator.pushNamed(
                            context, "viewChecking", arguments: [
                          user.name,
                          user.email,
                          user.phone,
                          user.picture,
                          value2.join()
                        ]),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                            horizontal: 100, vertical: 20)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    child: Text(
                      "Send Payment",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ],
        ));
  }

  fondo() {
    return Container();
  }
}
