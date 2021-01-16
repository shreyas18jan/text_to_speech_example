import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final flutterTTS = FlutterTts();

  @override
  void initState() {
    flutterTTS.setVolume(1.0);
    flutterTTS.setPitch(1.0);
    flutterTTS.setSpeechRate(0.80);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: AppBar(
          title: const Text('Text To Speech'),
        ),
        body: ListView(
          children: [
            SizedBox(height: 20.0),
            Container(
              child: TextField(
                controller: _textController,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
                ),
                decoration: InputDecoration(
                  hintText: 'Enter your Text here!',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                maxLines: 10,
              ),
              padding: EdgeInsets.all(10.0),
            ),
            SizedBox(height: 50.0),
            Container(
              padding: EdgeInsets.all(10.0),
              width: 100.0,
              height: 100.0,
              child: MaterialButton(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(50.0)
                ),
                color: Colors.blue,
                child: Center(
                    child: Text( 'Speech Configure' ,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        )
                    )
                ),
                onPressed: () {
                  flutterTTS.speak(_textController.text);
                },
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.all(10.0),
              width: 100.0,
              height: 100.0,
              child: MaterialButton(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(50.0)
                ),
                color: Colors.blue,
                child: Center(
                    child: Text( 'Save As audio file' ,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        )
                    )
                ),
                onPressed: () {
                  flutterTTS.synthesizeToFile(_textController.text, 'ExampleAudioCreated.mp3');
                  Fluttertoast.showToast(
                    msg: 'Please Check the Audio file in \n Storage > Internal Storage > Android > dat > com.thecommonguy.flutter_app > files ',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}