import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'movie_player_cubit.dart';
import 'movie_player_initial_params.dart';
import 'movie_player_state.dart';

class MoviePlayerPage extends StatefulWidget {
  final MoviePlayerCubit cubit;
  final MoviePlayerInitialParams initialParams;

  static const path = '/MoviePlayerPage';

  const MoviePlayerPage({
    Key? key,
    required this.cubit,
    required this.initialParams,
  }) : super(key: key);

  @override
  State<MoviePlayerPage> createState() => _MoviePlayerState();
}

class _MoviePlayerState extends State<MoviePlayerPage> {
  MoviePlayerCubit get cubit => widget.cubit;

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late ChewieController _chewieController;
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
    cubit.onInit(widget.initialParams);
    _setupVideoPlayer();
    // Enable full-screen mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  _setupVideoPlayer() {
    try {
      // Initialize the video player controller with the provided video URL
      _controller =
          VideoPlayerController.networkUrl(Uri.parse(widget.initialParams.url));
      _initializeVideoPlayerFuture = _controller.initialize().then((_) {
        _chewieController = ChewieController(
          videoPlayerController: _controller,
          autoPlay: true,
          fullScreenByDefault: true,
          looping: false,
        );
        // Automatically start playback when the video is ready
        // Close the player when the video ends
        _controller.addListener(() {
          if (_controller.value.position == _controller.value.duration) {
            Navigator.pop(context);
          }
        });
      });
    } catch (e) {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _controller.dispose();
    _returnToPortrait();
    // Restore the system UI mode on exit
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.initialParams.url);
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Chewie(controller: _chewieController),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
  void _returnToPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

}
