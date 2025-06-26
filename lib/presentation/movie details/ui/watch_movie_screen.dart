import 'package:flutter/material.dart';
import 'package:movies/core/model/movies_response.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchMovieScreen extends StatefulWidget {
  final Movies movie;

  const WatchMovieScreen({Key? key, required this.movie}) : super(key: key);

  @override
  State<WatchMovieScreen> createState() => _WatchMovieScreenState();
}

class _WatchMovieScreenState extends State<WatchMovieScreen> {
  late YoutubePlayerController _controller;
  bool hasTrailer = false;

  @override
  void initState() {
    super.initState();

    final trailerCode = widget.movie.ytTrailerCode;

    hasTrailer = trailerCode != null && trailerCode.isNotEmpty;

    if (hasTrailer) {
      _controller = YoutubePlayerController(
        initialVideoId: trailerCode!,
        flags: const YoutubePlayerFlags(
          controlsVisibleAtStart: true,
          mute: true,
          disableDragSeek: false,
          loop: false,
          forceHD: true,
          enableCaption: false,
        ),
      );
    }
  }

  @override
  void dispose() {
    if (hasTrailer) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text("Watch Movie")),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // ▶️ Main Video or Fallback Image
          if (hasTrailer)
            YoutubePlayer(
              controller: _controller,
              width: width,
              showVideoProgressIndicator: true,
            )
          else
            Image.network(
              widget.movie.largeCoverImage ?? '',
              height: height * 0.5,
              width: width,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: height * 0.5,
                width: width,
                color: Colors.grey,
                child: const Center(
                  child: Text(
                    "Video not found",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

          // 🔳 Overlay with Title and Year
          Container(
            height: height * 0.5,
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: height * 0.03,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.6),
                  Colors.black,
                ],
              ),
            ),
            child: Column(
              children: [
                // 🔙 Back and Bookmark
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    BackButton(color: Colors.white),
                    Icon(Icons.bookmark_outline, color: Colors.white),
                  ],
                ),
                const Spacer(),
                if (!hasTrailer)
                  const Icon(Icons.play_circle, color: Colors.white, size: 64),
                const Spacer(),
                // 📝 Movie Title
                Text(
                  widget.movie.title ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                // 📅 Year
                Text(
                  widget.movie.year?.toString() ?? '',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
