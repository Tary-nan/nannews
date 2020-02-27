import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_playout/audio.dart';
import 'package:flutter_playout/player_observer.dart';
import 'package:flutter_playout/player_state.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AudioPlayout extends StatefulWidget {
  // Audio url to play
  final String url;

  // Audio track title. this will also be displayed in lock screen controls
  final String title = "MTA International";

  // Audio track subtitle. this will also be displayed in lock screen controls
  final String subtitle = "Reaching The Corners Of The Earth";

  final PlayerState desiredState;
  final String frequence;
  final String radioImg;
  final String radioTitle;

  const AudioPlayout({Key key, this.desiredState,this.url, this.frequence, this.radioImg, this.radioTitle}) : super(key: key);

  @override
  _AudioPlayout createState() => _AudioPlayout();
}

class _AudioPlayout extends State<AudioPlayout> with PlayerObserver {
  Audio _audioPlayer;
  PlayerState audioPlayerState = PlayerState.STOPPED;
  bool _loading = false;
  bool _isLive = false;

  Duration duration = Duration(milliseconds: 1);
  Duration currentPlaybackPosition = Duration.zero;

  get isPlaying => audioPlayerState == PlayerState.PLAYING;
  get isPaused =>
      audioPlayerState == PlayerState.PAUSED ||
          audioPlayerState == PlayerState.STOPPED;

  get durationText =>
      duration != null ? duration.toString().split('.').first : '';
  get positionText => currentPlaybackPosition != null
      ? currentPlaybackPosition.toString().split('.').first
      : '';

  @override
  void initState() {
    super.initState();
    // Init audio player with a callback to handle events
    Future.delayed(Duration(seconds: 2),_load);
    // Listen for audio player events
    listenForAudioPlayerEvents();
  }

    Widget _load(){
      _audioPlayer = Audio.instance();
      _audioPlayer.play(widget.url,isLiveStream: true);
  }

  @override
  void didUpdateWidget(AudioPlayout oldWidget) {
    if (oldWidget.desiredState != widget.desiredState) {
      _onDesiredStateChanged(oldWidget);
    } else if (oldWidget.url != widget.url) {
      play();
    }
    super.didUpdateWidget(oldWidget);
  }

  /// The [desiredState] flag has changed so need to update playback to
  /// reflect the new state.
  void _onDesiredStateChanged(AudioPlayout oldWidget) async {
    switch (widget.desiredState) {
      case PlayerState.PLAYING:
        play();
        break;
      case PlayerState.PAUSED:
        pause();
        break;
      case PlayerState.STOPPED:
        pause();
        break;
    }
  }

  @override
  void onPlay() {
    setState(() {
      audioPlayerState = PlayerState.PLAYING;
      _loading = false;
    });
  }

  @override
  void onPause() {
    setState(() {
      audioPlayerState = PlayerState.PAUSED;
    });
  }

  @override
  void onComplete() {
    setState(() {
      audioPlayerState = PlayerState.PAUSED;
      currentPlaybackPosition = Duration.zero;
    });
  }

  @override
  void onTime(int position) {
    setState(() {
      currentPlaybackPosition = Duration(seconds: position);
    });
  }

  @override
  void onSeek(int position, double offset) {
    super.onSeek(position, offset);
  }

  @override
  void onDuration(int duration) {
    if (duration <= 0) {
      setState(() {
        _isLive = true;
      });
    } else {
      setState(() {
        _isLive = false;
        this.duration = Duration(milliseconds: duration);
      });
    }
  }

  @override
  void onError(String error) {
    super.onError(error);
  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
         
          Positioned(
            top: height*0.13,
                      child: Container(
                width: width,
                height: height,
               
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, i) {
                    return Row(
                      children: <Widget>[
                        Container(
                          width: 2,
                          height: height / 15,
                          color: Colors.white54,
                        ),
                        SizedBox(
                          width: width / 40,
                        ),
                        Container(
                          width: 2,
                          height: height / 15,
                          color: Colors.white54,
                        ),
                        SizedBox(
                          width: width / 40,
                        ),
                        Container(
                          width: 2,
                          height: height / 15,
                          color: Colors.white54,
                        ),
                        SizedBox(
                          width: width / 40,
                        ),
                        Container(
                          width: 2,
                          height: height / 10,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: width / 40,
                        ),
                      ],
                    );
                  },
                ) /* Container(child:Image.asset("image/wave.png",fit: BoxFit.cover,),), */
                ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.frequence,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: height / 15),
                ),
                
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                height: 150,
                width:150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                          image: DecorationImage(
                            image: NetworkImage(widget.radioImg),
                            fit: BoxFit.cover,
                           // colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
                              )
                            ),
                        child: SpinKitWave(
                                color: Colors.white,
                                size: 40.0,
                              ),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: width / 10,
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Text(
                        "Radio NaN",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: height / 30),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Text(
                        widget.radioTitle,
                        style: TextStyle(
                            color: Colors.white30,
                            fontWeight: FontWeight.bold,
                            fontSize: height / 50),
                      ),
                      
                    ],
                  ),
                ),
             
                
                Container(
                  child: Column(
                    children: <Widget>[
                      
                      SizedBox(
                        height: height / 15,
                      ),
                      Container(
                        width: 3,
                        height: height / 8,
                        color: Colors.red,
                      ),
                      RotatedBox(
                        quarterTurns: 3,
                        child: Icon(
                          Icons.play_arrow,
                          size: width / 10,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
               
                GestureDetector(
                      onTap: (){
                        if (isPlaying) {
                          pause();
                        } else {
                          play();
                        }
                      },
                  child: Transform.rotate(
                    angle: pi / 4,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                      child: (isPlaying)
                          ? Transform.rotate(
                              angle: pi / 1.35,
                              child: Icon(
                                Icons.pause,
                                size: width / 10,
                                color: Colors.white,
                              ))
                          : Transform.rotate(
                              angle: pi / 2.3,
                              child: Icon(
                                Icons.play_arrow,
                                size: width / 10,
                                color: Colors.white,
                              )),

                      /*Transform.rotate(
                        angle: pi/1.35,
                        child: Icon(Icons.pause,size: width/10,color: Colors.white,))  ,*/
                    ),
                  ),
                )
              ],
            ),
          ),
           Positioned(
            top: 50,
            left: 30,
            child: InkWell(
              onTap: ()=>Navigator.pop(context),
              child: Icon(Icons.close,color:Colors.white),
            ),
          ),
        ],
      ),
    );
  }

 

  String _playbackPositionString() {
    var currentPosition = Duration(
        seconds: duration.inSeconds - currentPlaybackPosition.inSeconds);

    return currentPosition.toString().split('.').first;
  }

  // Request audio play
  Future<void> play() async {
    setState(() {
      _loading = true;
    });
    // here we send position in case user has scrubbed already before hitting
    // play in which case we want playback to start from where user has
    // requested
    _audioPlayer.play(widget.url,
        title: widget.title,
        subtitle: widget.subtitle,
        position: currentPlaybackPosition,
        isLiveStream: false);
  }

  // Request audio pause
  Future<void> pause() async {
    _audioPlayer.pause();
    setState(() => audioPlayerState = PlayerState.PAUSED);
  }

  // Request audio stop. this will also clear lock screen controls
  Future<void> stop() async {
    _audioPlayer.reset();

    setState(() {
      audioPlayerState = PlayerState.STOPPED;
      currentPlaybackPosition = Duration.zero;
    });
  }

  // Seek to a point in seconds
  Future<void> seekTo(double milliseconds) async {
    setState(() {
      currentPlaybackPosition = Duration(milliseconds: milliseconds.toInt());
    });
    _audioPlayer.seekTo(milliseconds / 1000);
  }

  @override
  void dispose() {
    if (mounted) {
      _audioPlayer.dispose();
    }
    super.dispose();
  }
}