import 'package:flutter/material.dart';
import 'package:flutter_app/src/Global.dart';
import 'package:flutter_app/src/Screens/Config.dart';
import 'package:flutter_app/src/Screens/Final.dart';
import 'package:flutter_app/src/Screens/IniConfig.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class Identificacion extends StatefulWidget {
  @override
  _IdentificacionState createState() => _IdentificacionState();
}

class _IdentificacionState extends State<Identificacion> {
  bool isSwitched = false;
  PickedFile _imageFile;
  dynamic _pickImageError;
  bool isVideo = false;
  VideoPlayerController _controller;
  VideoPlayerController _toBeDisposed;
  String _retrieveDataError;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  Future<void> _playVideo(PickedFile file) async {
    if (file != null && mounted) {
      await _disposeVideoController();
      if (kIsWeb) {
        _controller = VideoPlayerController.network(file.path);
        // In web, most browsers won't honor a programmatic call to .play
        // if the video has a sound track (and is not muted).
        // Mute the video so it auto-plays in web!
        // This is not needed if the call to .play is the result of user
        // interaction (clicking on a "play" button, for example).
        await _controller.setVolume(0.0);
      } else {
        _controller = VideoPlayerController.file(File(file.path));
        await _controller.setVolume(1.0);
      }
      await _controller.initialize();
      await _controller.setLooping(true);
      await _controller.play();
      setState(() {});
    }
  }

  void _onImageButtonPressed(ImageSource source, {BuildContext context}) async {
    if (_controller != null) {
      await _controller.setVolume(0.0);
    }
    if (isVideo) {
      final PickedFile file = await _picker.getVideo(
          source: source, maxDuration: const Duration(seconds: 10));
      await _playVideo(file);
    } else {
      await _displayPickImageDialog(context,
          (double maxWidth, double maxHeight, int quality) async {
        try {
          final pickedFile = await _picker.getImage(
            source: source,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          );
          setState(() {
            _imageFile = pickedFile;
          });
        } catch (e) {
          setState(() {
            _pickImageError = e;
          });
        }
      });
    }
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller.setVolume(0.0);
      _controller.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    _disposeVideoController();
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  Future<void> _disposeVideoController() async {
    if (_toBeDisposed != null) {
      await _toBeDisposed.dispose();
    }
    _toBeDisposed = _controller;
    _controller = null;
  }

  Widget _previewVideo() {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_controller == null) {
      return const Text(
        'You have not yet picked a video',
        textAlign: TextAlign.center,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatioVideo(_controller),
    );
  }

  Widget _previewImage() {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFile != null) {
      if (kIsWeb) {
        // Why network?
        // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
        return Image.network(_imageFile.path);
      } else {
        return Image.file(File(_imageFile.path));
      }
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Future<void> retrieveLostData() async {
    final LostData response = await _picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        isVideo = true;
        await _playVideo(response.file);
      } else {
        isVideo = false;
        setState(() {
          _imageFile = response.file;
        });
      }
    } else {
      _retrieveDataError = response.exception.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Identificación',
            style: TextStyle(fontSize: 27),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF072146),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Datos para la Identificación",
                          style: TextStyle(
                              color: Color(0xFF1464A5),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Container(
                        height: 74,
                        // margin: EdgeInsets.only(top: 15, bottom: 15),
                        // color: Color(0xFF1464A5),
                        alignment: Alignment.center,
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Introduce tu DNI o NIE'),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          margin: EdgeInsets.only(top: 25, bottom: 30),
                          height: 74,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 15),
                                child: Stack(
                                    alignment: const Alignment(0, 0),
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Color(0xFF1464A5),
                                        radius: 40,
                                      ),
                                      Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 40.0,
                                      ),
                                    ]),
                              ),
                              Text("Realizar la Identificación Facial",
                                  style: TextStyle(
                                      color: Color(0xFF1464A5), fontSize: 19))
                            ],
                          ),
                        ),
                        onTap: () => {
                          _onImageButtonPressed(ImageSource.camera,
                              context: context)
                        },
                      )
                    ],
                  ),
                  Container(
                    height: 74,
                    padding: EdgeInsets.only(left: 10),
                    // color: Color(0xFF1464A5),
                    alignment: Alignment.center,
                    child: Text("Datos requeridos por la empresa venderdora",
                        style: TextStyle(
                            color: Color(0xFF1464A5),
                            fontSize: 20,
                            fontWeight: FontWeight.normal)),
                  ),
                  InkWell(
                    child: Container(
                      height: 74,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1.0, color: Color(0xFF707070)),
                          bottom:
                              BorderSide(width: 1.0, color: Color(0xFF707070)),
                          left:
                              BorderSide(width: 1.0, color: Color(0xFF707070)),
                          right:
                              BorderSide(width: 1.0, color: Color(0xFF707070)),
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: _getIcon(true, ""),
                          ),
                          Expanded(
                            child: Text(
                              "Nombre y Apellidos",
                              style: TextStyle(
                                  color: Color(0xFF1464A5), fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () => {
                      setState(() {
                        // Nomina = !Nomina; // we got a new "droplet"
                      })
                    },
                  ),
                  InkWell(
                    child: Container(
                      height: 74,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(width: 1.0, color: Color(0xFF707070)),
                          left:
                              BorderSide(width: 1.0, color: Color(0xFF707070)),
                          right:
                              BorderSide(width: 1.0, color: Color(0xFF707070)),
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: _getIcon(true, ""),
                          ),
                          Expanded(
                            child: Text(
                              "Cuenta Bancaria",
                              style: TextStyle(
                                  color: Color(0xFF1464A5), fontSize: 17),
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: () => {
                      setState(() {
                        // Nomina = !Nomina; // we got a new "droplet"
                      })
                    },
                  ),
                  InkWell(
                    child: Container(
                      height: 74,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(width: 1.0, color: Color(0xFF707070)),
                          left:
                              BorderSide(width: 1.0, color: Color(0xFF707070)),
                          right:
                              BorderSide(width: 1.0, color: Color(0xFF707070)),
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: _getIcon(true, ""),
                          ),
                          Expanded(
                            child: Text(
                              "DNI",
                              style: TextStyle(
                                  color: Color(0xFF1464A5), fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () => {
                      setState(() {
                        // Nomina = !Nomina; // we got a new "droplet"
                      })
                    },
                  )
                ],
              )),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Final()),
            );
          },
          label: Text("Finalizar",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 19, color: Color(0xFF1464A5))),
          icon: Icon(
            Icons.navigate_next,
            color: Color(0xFF1464A5),
          ),
          backgroundColor: Color(0xFFF8CD50),
        ));
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Identificacion Realizada"),
          content: new Text(
              "La Identificación ya se realizó con éxito para mas información póngase en contacto con nuestro servicio de atención al cliente"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cerrar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _getIcon(isAuth, number) {
    if (isAuth == false)
      return Stack(
        alignment: const Alignment(0, 0),
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFF1464A5),
            radius: 20,
          ),
          Text("")
        ],
      );
    else {
      return Stack(
        alignment: const Alignment(0, 0),
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFFF8CD50),
            radius: 20,
          ),
          Icon(
            Icons.file_download_done,
            color: Colors.white,
            size: 24.0,
          ),
        ],
      );
    }
  }

  Text _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Identificación Biométrica'),
            content: Column(
              children: <Widget>[
                Text("Se procederá a la Identificacion Facial")
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                  child: const Text('Capturar Imágen'),
                  onPressed: () {
                    double width = maxWidthController.text.isNotEmpty
                        ? double.parse(maxWidthController.text)
                        : null;
                    double height = maxHeightController.text.isNotEmpty
                        ? double.parse(maxHeightController.text)
                        : null;
                    int quality = qualityController.text.isNotEmpty
                        ? int.parse(qualityController.text)
                        : null;
                    onPick(width, height, quality);
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }
}

typedef void OnPickImageCallback(
    double maxWidth, double maxHeight, int quality);

class AspectRatioVideo extends StatefulWidget {
  AspectRatioVideo(this.controller);

  final VideoPlayerController controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller.value.initialized) {
      initialized = controller.value.initialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_onVideoControllerUpdate);
  }

  @override
  void dispose() {
    controller.removeListener(_onVideoControllerUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: controller.value?.aspectRatio,
          child: VideoPlayer(controller),
        ),
      );
    } else {
      return Container();
    }
  }
}
