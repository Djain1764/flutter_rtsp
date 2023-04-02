import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:video_player/video_player.dart';

class LiveStreaming extends StatefulWidget {
  const LiveStreaming({super.key});

  @override
  State<LiveStreaming> createState() => _LiveStreamingState();
}

class _LiveStreamingState extends State<LiveStreaming> {
  // late VlcPlayerController _controller;
  // late Future<void> _initializeVideoPlayerFuture;

  // @override
  // void initState() {
  //   super.initState();

  //   // Create and store the VideoPlayerController. The VideoPlayerController
  //   // offers several different constructors to play videos from assets, files,
  //   // or the internet.
  //   _controller = VlcPlayerController.network(
  //     // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
  //     'rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mp4',
  //   );

  //   _initializeVideoPlayerFuture = _controller.initialize();
  //   _controller.setLooping(true);
  // }

  // @override
  // void dispose() {
  //   // Ensure disposing of the VideoPlayerController to free up resources.
  //   _controller.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    bool _isPlaying = true;
    final VlcPlayerController videoPlayerController =
        VlcPlayerController.network(
      // 'https://media.w3.org/2010/05/sintel/trailer.mp4',
      // 'rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mp4',
      "rtsp://gkamath:mywyzecam@192.168.1.19/live",
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );

    return Scaffold(
      appBar: AppBar(),
      body:
          // FutureBuilder(
          //   future: _initializeVideoPlayerFuture,
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.done) {
          //       // If the VideoPlayerController has finished initialization, use
          //       // the data it provides to limit the aspect ratio of the video.
          //       return AspectRatio(
          //         aspectRatio: _controller.value.aspectRatio,
          //         // Use the VideoPlayer widget to display the video.
          //         child: VlcPlayer(
          //           // _controller
          //           controller: _controller,
          //           aspectRatio: 16 / 9,
          //         ),
          //       );
          //     } else {
          //       // If the VideoPlayerController is still initializing, show a
          //       // loading spinner.
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     // Wrap the play or pause in a call to `setState`. This ensures the
          //     // correct icon is shown.
          //     setState(() {
          //       // If the video is playing, pause it.
          //       if (_controller.value.isPlaying) {
          //         _controller.pause();
          //       } else {
          //         // If the video is paused, play it.
          //         _controller.play();
          //       }
          //     });
          //   },
          //   // Display the correct icon depending on the state of the player.
          //   child: Icon(
          //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          //   ),
          // ),
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Spacer(),
          VlcPlayer(
            controller: videoPlayerController,
            aspectRatio: 16 / 9,
            placeholder: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          Spacer(),
          Spacer(),
          Spacer(),
          // Row(
          //   children: [
          //     TextButton(
          //         onPressed: () {},
          //         child: const Icon(
          //           Icons.fast_rewind,
          //           size: 28,
          //           color: Colors.black,
          //         )),
          //     TextButton(
          //         onPressed: () {
          //           if (_isPlaying) {
          //             setState(() {
          //               _isPlaying = false;
          //             });
          //             videoPlayerController.pause();
          //           } else {
          //             setState(() {
          //               _isPlaying = true;
          //             });
          //             videoPlayerController.play();
          //           }
          //         },
          //         child: const Icon(
          //           Icons.pause,
          //           // isPlaying ? Icons.pause : Icons.play_arrow,
          //           size: 28,
          //           color: Colors.black,
          //         )),
          //     TextButton(
          //         onPressed: () {},
          //         child: const Icon(
          //           Icons.fast_forward,
          //           size: 28,
          //           color: Colors.black,
          //         )),
          //   ],
          // ),
        ],
      ),
    );
  }
}
