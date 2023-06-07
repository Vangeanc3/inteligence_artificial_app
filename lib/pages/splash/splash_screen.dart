import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset("assets/app/Logo_Revial.mp4")
      ..initialize().then((_) {
        setState(() {});
      })
      ..setVolume(0.0);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _playVideo(context);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(
                    _controller,
                  ),
                )
              : Container(),
        ));
  }

  void _playVideo(BuildContext context) async {
    // INICIANDO O VIDEO
    _controller.play();

    // ADD O DELAY PARA INICIAR O VIDEO COMPLETO
    await Future.delayed(const Duration(seconds: 4));

    //  NAVEGANDO PARA A TELA INICIAL
    Navigator.pushReplacementNamed(context, "/welcome");
  }
}
