import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String name;
  final String pronoun;
  final String music;
  final String imageUrl;

  const Profile({
    Key? key,
    required this.name,
    required this.pronoun,
    required this.music,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation; //zoom

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.97, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          );
        },
        child: Card(
          color: Colors.black,
          shadowColor: const Color.fromARGB(255, 231, 140, 222),
          elevation: 19,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(widget.imageUrl),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.name,
                  style: const TextStyle(
                      fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.pronoun,
                  style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 250, 202, 246)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Icon(Icons.headphones,
                      color: Color.fromARGB(255, 255, 255, 255), size: 16),
                  const SizedBox(width: 6),
                  Text(
                      widget.music,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 202, 202, 202))),
                  const SizedBox(height: 12),
                ]),
                Padding(padding: EdgeInsets.only(bottom: 20.0)),

                Text(
                  "2003 ;",
                  style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 202, 202, 202)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
