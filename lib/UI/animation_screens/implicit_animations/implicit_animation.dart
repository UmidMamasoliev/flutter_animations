import 'package:flutter/material.dart';

const defaultWidth = 200.0;

class ImplicitAnimation extends StatefulWidget {
  final Image image;
  const ImplicitAnimation({super.key, required this.image});

  @override
  State<ImplicitAnimation> createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  bool _isZoomedIn = false;
  String _buttonTitle = 'Zoom In';
  double _width = defaultWidth;
  Curve _curve = Curves.bounceOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 370),
                curve: _curve,
                width: _width,
                child: Hero(
                  tag: 'assets/images/wallpaper.jpg',
                  child: widget.image,
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _isZoomedIn = !_isZoomedIn;
                _buttonTitle = _isZoomedIn ? 'Zoom Out' : 'Zoom In';
                _width = _isZoomedIn
                    ? MediaQuery.of(context).size.width
                    : defaultWidth;
                _curve = _isZoomedIn ? Curves.bounceInOut : Curves.bounceOut;
              });
            },
            child: Text(_buttonTitle),
          ),
        ],
      ),
    );
  }
}
