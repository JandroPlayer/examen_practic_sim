import 'package:flutter/material.dart';

class UserPhotoWidget extends StatelessWidget {
  final String photoUrl;
  final double radius;

  UserPhotoWidget({
    Key? key,
    required this.photoUrl,
    this.radius = 50.0, // Definir un radio por defecto para el círculo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(photoUrl),
      onBackgroundImageError: (exception, stackTrace) {
        // Si la imagen no se puede cargar, se muestra una imagen por defecto
      },
      backgroundColor: Colors.transparent, // Para asegurar que el fondo sea transparente
    );
  }
}
