import 'package:flutter/material.dart';
import 'package:instagram_clone/models/camera_state.dart';
import 'package:instagram_clone/models/gallert_state.dart';
import 'package:instagram_clone/widgets/my_gallery.dart';
import 'package:instagram_clone/widgets/take_photo.dart';
import 'package:provider/provider.dart';

class CameraScreen extends StatefulWidget {
  final CameraState _cameraState = CameraState();
  final GalleryState _galleryState = GalleryState();
  @override
  _CameraScreenState createState() {
    _cameraState.getReadyToTakePhoto();
    _galleryState.initProvider();
    return _CameraScreenState();
  }
}

class _CameraScreenState extends State<CameraScreen> {
  int _currentIndex = 1;
  PageController _pageController = PageController(initialPage: 1);
  String _title = "Photo";
  @override
  void dispose() {
    _pageController.dispose();
    widget._cameraState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CameraState>.value(
          value: widget._cameraState,
        ),
        ChangeNotifierProvider<GalleryState>.value(
          value: widget._galleryState,
        ),
      ],
      child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: Colors.black,
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              _title,
              style: TextStyle(color: Colors.black),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 0,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black54,
            currentIndex: _currentIndex,
            onTap: _onItemTabbed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.photo_album), label: 'GALLERY'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.camera_alt), label: 'PHOTO'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.video_collection), label: 'VIDEO')
            ],
          ),
          body: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
                switch (index) {
                  case 0:
                    _title = 'Gallery';
                    break;
                  case 1:
                    _title = 'Photo';
                    break;
                  case 2:
                    _title = 'Video';
                    break;
                }
              });
            },
            children: [
              MyGallery(),
              TakePhoto(),
              Container(
                color: Colors.greenAccent,
              ),
            ],
          )),
    );
  }

  void _onItemTabbed(index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(_currentIndex,
          duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
    });
  }
}
