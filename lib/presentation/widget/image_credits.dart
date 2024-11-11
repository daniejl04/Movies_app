import 'package:flutter/material.dart';

class MyPhoto extends StatelessWidget {
  final String imageUrl;

  const MyPhoto(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(80),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover, 
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.2,
            height: size.height * 0.12,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: size.width * 0.18,
            height: size.height * 0.12,
            color: Colors.grey.shade300, 
            alignment: Alignment.center,
            child: const Icon(Icons.person, size: 100, color: Colors.black38),
          );
        },
      ),
    );
  }
}
