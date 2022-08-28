import 'package:cashflow/model/Video.dart';
import 'package:cashflow/service/PexelsApi.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class UiDesign1 extends StatefulWidget {
  const UiDesign1({Key? key}) : super(key: key);

  @override
  State<UiDesign1> createState() => _UiDesign1State();
}

class _UiDesign1State extends State<UiDesign1> {
  VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Ocean"),
                Text("Nature"),
                Text("Space"),
                Text("Sky"),
                Text("Forest")
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
                width: size.width,
                height: size.height * 0.8,
                child: FutureBuilder(
                  future: Pexel().getVideo("nature"),
                  builder: (context, AsyncSnapshot<List<Video>> snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        itemCount: snapshot.data!.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                        itemBuilder: (context, index) {
                          return Center(
                              child: Text(snapshot.data![index].name!));
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }
}
