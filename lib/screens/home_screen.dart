import '../models/models.dart';
import '../services/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../ui/ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    List<User> usuaris = userService.users;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: usuaris.isEmpty
          ? Loading()
          : ListView.builder(
              itemCount: usuaris.length,
              itemBuilder: ((context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    color: Colors.red,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                  ),
                  child: GestureDetector(
                    child: UserCard(usuari: usuaris[index]),
                    onTap: () {
                      userService.tempUser = usuaris[index].copy();
                      Navigator.of(context).pushNamed('detail');
                    },
                  ),
                  onDismissed: (direction) {
                    if (usuaris.length < 2) {
                      userService.loadUsers();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('No es pot esborrar tots els elements!')));
                    } else {
                      userService.deleteUser(usuaris[index]);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              '${userService.users[index].name} esborrat')));
                    }
                  },
                );
              }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           userService.tempUser = User(
            id: '',
            address: 'Example address',
            email: 'email1@example.com',
            name: 'Pep',
            phone: '3434342',
            photo: '',
          );
          Navigator.of(context).pushNamed('detail');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
