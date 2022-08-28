import 'package:cashflow/model/Video.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Pexel {
  getPhoto() async {
    try {
      Response response = await Dio().get(
          "https://api.pexels.com/v1/curated?per_page=5",
          options: Options(headers: {
            "Authorization":
                "563492ad6f917000010000010b6cc8746f814a2b8c0b8c65907aed4e"
          }));
      print(response.data);
    } catch (e) {
      print(e);
    }
  }

  Future<List<Video>> getVideo(category) async {
    List<Video> listVideo = [];
    try {
      Response response = await Dio().get(
          "https://api.pexels.com/videos/search?query=$category&per_page=6",
          options: Options(headers: {
            "Authorization":
                "563492ad6f917000010000010b6cc8746f814a2b8c0b8c65907aed4e"
          }));

      for (var video in response.data["videos"]) {
        final u = video["user"]["name"];
        print(video["user"]["name"]);
        final linkVideo = video["video_files"][0]["link"];
        print(video["video_files"][0]["link"]);
        listVideo.add(Video(link: linkVideo, name: u));
      }
      return listVideo;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
