import 'package:anjayclub/model/Drama.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

void main() => runApp(DetailArticle());

class DetailArticle extends StatefulWidget {
  final String drama;
  DetailArticle({Key key,@required this.drama}) : super(key:key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<DetailArticle> {
  VideoPlayerController _controller;


  @override
  void initState() {
    super.initState();
      print("ini url video ${widget.drama}");
    _controller = VideoPlayerController.network(widget.drama)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Column(
          children: [
            RotatedBox(quarterTurns: 3,child: Center(child:_controller.value.initialized
                ? AspectRatio(

              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
                : Container(),
            ) ),

          ],

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}