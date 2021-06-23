import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key key}) : super(key: key);

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        _onScroll();
      });
    super.initState();
  }

  double _scrollOffset = 0.0;
  void _onScroll() {
    setState(() {
      _scrollOffset = _scrollController.offset;
      print(_scrollOffset);
    });
  }

  double _layerSpeed1 = 0.5;
  double _layerSpeed2 = 0.45;
  double _layerSpeed3 = 0.42;
  double _layerSpeed4 = 0.374;
  double sunSpeed = 0.2;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 66, 240, 210),
              Color.fromARGB(255, 253, 244, 192),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: size.height * 0.5 + (_scrollOffset * sunSpeed),
              left: 0,
              right: size.width * 0.3,
              child: SvgPicture.asset("assets/sun.svg"),
            ),
            Positioned(
              bottom: _layerSpeed4 * _scrollOffset,
              left: 0,
              right: 0,
              child: SvgPicture.asset("assets/mountains-layer-4.svg"),
            ),
            Positioned(
              bottom: _layerSpeed3 * _scrollOffset,
              left: 0,
              right: 0,
              child: SvgPicture.asset("assets/mountains-layer-2.svg"),
            ),
            Positioned(
              bottom: _layerSpeed2 * _scrollOffset,
              left: 0,
              right: 0,
              child: SvgPicture.asset("assets/trees-layer-2.svg"),
            ),
            Positioned(
              bottom: -50 + _layerSpeed1 * _scrollOffset,
              left: 0,
              right: 0,
              child: SvgPicture.asset("assets/layer-1.svg"),
            ),
            Positioned(
              top: size.height - (_layerSpeed1 * _scrollOffset),
              left: 0,
              right: 0,
              height: size.height,
              child: Container(
                color: Colors.black,
              ),
            ),
            Positioned.fill(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                  child: SizedBox(
                    height: size.height * 2,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
