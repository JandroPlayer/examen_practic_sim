import 'package:firebase_database/firebase_database.dart';
import 'package:examen_practic_sim/models/user.dart';

class FakeApi {
  final DatabaseReference _database = FirebaseDatabase.instance.ref('users');

  // Obtenir tots els usuaris
  Future<List<User>> getAllUsers() async {
    final snapshot = await _database.get();
    if (snapshot.exists) {
      final Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
      return data.entries
          .map((entry) => User.fromJson(entry.key, Map<String, dynamic>.from(entry.value)))
          .toList();
    } else {
      return [];
    }
  }

  // Verificar credencials d'usuari (login)
  Future<User?> login(String email, String password) async {
    final snapshot = await _database.get();
    if (snapshot.exists) {
      final Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
      for (var entry in data.entries) {
        final user = User.fromJson(entry.key, Map<String, dynamic>.from(entry.value));
        if (user.email == email && user.phone == password) {  // Simulant la contrasenya com a telèfon
          return user;
        }
      }
    }
    return null;
  }

  // Afegir un usuari nou
  Future<void> addUser(User user) async {
    await _database.child(user.id).set(user.toJson());
  }

  // Actualitzar un usuari
  Future<void> updateUser(User user) async {
    await _database.child(user.id).update(user.toJson());
  }

  // Esborrar un usuari
  Future<void> deleteUser(String id) async {
    await _database.child(id).remove();
  }
}
