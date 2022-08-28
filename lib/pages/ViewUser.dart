import 'package:cashflow/model/User.dart';
import 'package:cashflow/service/GetUser.dart';
import 'package:cashflow/service/PexelsApi.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class ViewUser extends StatefulWidget {
  ViewUser({Key? key}) : super(key: key);

  @override
  State<ViewUser> createState() => _ViewUserState();
}

class _ViewUserState extends State<ViewUser> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _moveright;
  Animation<double>? _opacity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));

    _moveright = Tween(begin: 400.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.linear));
    _opacity = Tween(begin: 0.2, end: 1.0)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.linear));
    GetUser().getUser();
    //Pexel().getPhoto();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _controller!.forward();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Choose Recipient",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            EvaIcons.settings2Outline,
            color: Colors.grey,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.9,
                height: size.height * 0.06,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    Text(
                      "Search by email, phone or name",
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: const [
              SizedBox(
                width: 30,
              ),
              Text(
                "Favorite",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: size.width,
            height: size.height * 0.7,
            child: FutureBuilder(
              future: GetUser().getUser(),
              builder: (context, AsyncSnapshot<List<User>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return AnimatedBuilder(
                        animation: _controller!,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0.0, _moveright!.value),
                            child: Opacity(
                              opacity: _opacity!.value,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, "viewtransation",
                                      arguments: snapshot.data![index]);
                                },
                                child: ListTile(
                                  leading: Hero(
                                    tag: snapshot.data![index].phone!,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          snapshot.data![index].picture!),
                                    ),
                                  ),
                                  title: Hero(
                                      tag: snapshot.data![index].name!,
                                      child: Text(snapshot.data![index].name!)),
                                  subtitle: Hero(
                                      tag: snapshot.data![index].email!,
                                      child:
                                          Text(snapshot.data![index].email!)),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator.adaptive());
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
