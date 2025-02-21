import 'package:flutter/material.dart';

// Widget para mostrar la foto del usuario o las iniciales si no tiene foto
class UserAvatarWidget extends StatelessWidget {
  final String photoUrl;
  final String name;

  const UserAvatarWidget({required this.photoUrl, required this.name});

  // Método para obtener las iniciales del nombre del usuario
  String getInitials(String fullName) {
    // Divide el nombre completo por espacios
    List<String> words = fullName.split(" ");
    // Toma la primera letra de cada palabra y únela
    return words.map((word) => word.isNotEmpty ? word[0] : "").take(2).join().toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    // Si la foto está vacía, mostramos las iniciales del nombre
    if (photoUrl.isEmpty || photoUrl == 'url') {
      // Extraemos las iniciales del nombre
      String initials = getInitials(name);

      return CircleAvatar(
        radius: 30,
        backgroundColor: Colors.blue, // Color de fondo del avatar
        child: Text(
          initials,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(photoUrl),
        backgroundColor: Colors.transparent,
      );
    }
  }
}
