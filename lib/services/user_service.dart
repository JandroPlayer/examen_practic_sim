import 'dart:convert';
import '../models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserService extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String _baseUrl =
      "examenpracticsim-default-rtdb.europe-west1.firebasedatabase.app";
  List<User> users = [];
  late User tempUser;
  User? newUser;

  UserService() {
    this.loadUsers();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<void> loadUsers() async {
    users.clear();
    final url = Uri.https(_baseUrl, 'users.json');
    final response = await http.get(url);
    final Map<String, dynamic> usersMap = json.decode(response.body);

    // Mapejam la resposta del servidor, per cada usuari, el convertim a la classe i l'afegim a la llista
    usersMap.forEach((key, value) {
      final auxUser = User.fromMap(value).copyWith(id: key);
      users.add(auxUser);
    });

    notifyListeners();
  }

  Future<User?> login(String email, String password) async {
    final url = Uri.https(_baseUrl, 'users.json');
    final response = await http.get(url);
    final Map<String, dynamic> usersMap = json.decode(response.body);

    for (var user in usersMap.values) {
      final auxUser = User.fromMap(user);
      if (auxUser.email == email && auxUser.phone == password) { // Simulant la contrasenya amb el camp phone
        return auxUser;
      }
    }
    return null;
  }

// Método para actualizar tempUser
  void updateTempUser(User updatedUser) {
    tempUser = updatedUser;
    notifyListeners();  // Notificamos a los listeners que ha habido un cambio
  }

  Future<void> saveOrCreateUser() async {
  if (tempUser.id == null || tempUser.id == '') {
    // Creamos el usuario y generamos la ID automáticamente
    await this.createUser();
  } else {
    // Actualizamos el usuario si ya tiene una ID
    await this.updateUser();
  }
  loadUsers(); // Recargamos la lista de usuarios después de guardar o crear
}


  Future<void> updateUser() async {
    final url = Uri.https(_baseUrl, 'users/${tempUser.id}.json');
    final response = await http.put(url, body: tempUser.toJson());
    final decodedData = response.body;
  }

  Future<void> createUser() async {
  final url = Uri.https(_baseUrl, 'users.json');
  final response = await http.post(url, body: tempUser.toJson());
  
  final decodedData = json.decode(response.body);
  final newId = decodedData['name'];  // Firebase genera una ID en el campo 'name'

  // Asignamos la ID generada a tempUser
  tempUser = tempUser.copyWith(id: newId);
}


  Future<void> deleteUser(User usuari) async {
    final url = Uri.https(_baseUrl, 'users/${usuari.id}.json');
    final response = await http.delete(url);
    final decodedData = json.decode(response.body);
    print(decodedData);
    loadUsers();
  }
}