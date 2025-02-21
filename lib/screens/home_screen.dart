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
         actions: [
          // Logout button in the app bar
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('logOrReg'); // Navigate to logOrReg screen
            },
          ),
        ],
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
                    child: ListTile(
                      leading: UserAvatarWidget(
                        photoUrl: usuaris[index].photo,
                        name: usuaris[index].name,
                      ),
                      title: Text(usuaris[index].name),
                      subtitle: Text(usuaris[index].email),
                    ),
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
            address: 'Example address',
            email: 'email1@example.com',
            name: 'Pep',
            phone: '3434342',
            photo: 'https://picsum.photos/250?image=9',
          );
          Navigator.of(context).pushNamed('detail');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
