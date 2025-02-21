import '../models/models.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User usuari;
  const UserCard({super.key, required this.usuari});

  // Método para obtener las iniciales del nombre del usuario
  String getInitials(String fullName) {
    // Divide el nombre completo por espacios
    List<String> words = fullName.split(" ");
    // Toma la primera letra de cada palabra y únela
    return words.map((word) => word.isNotEmpty ? word[0] : "").take(2).join().toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          getInitials(usuari.name),
          style: TextStyle(color: Colors.white), // Opcional para asegurar que el texto contraste
        ),
        backgroundColor: Colors.blue, // Color de fondo del avatar
      ),
      title: Text(usuari.name),
      subtitle: Text(
        "${usuari.email}\n${usuari.phone}",
        style: TextStyle(color: Colors.black.withOpacity(0.6)),
      ),
      trailing: SizedBox(
        width: 20,
        height: 20,
        child: Checkbox(
          value: usuari.photo.isNotEmpty,
          onChanged: ((value) => print(value)),
        ),
      ),
    );
  }
}

