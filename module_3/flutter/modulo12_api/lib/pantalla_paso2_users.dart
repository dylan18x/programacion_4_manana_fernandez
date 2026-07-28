import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'todo_dto.dart';

class PantallaPaso2Users extends StatelessWidget {
  const PantallaPaso2Users({super.key});

  Future<List<UserDto>> _fetchUsers() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users?_limit=15'),
    );
    final lista = jsonDecode(res.body) as List<dynamic>;
    return lista
        .map((e) => UserDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 2 · DTO simple'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<UserDto>>(
        future: _fetchUsers(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          final users = snap.data!;
          final user = users[0];
          return Column(
            children: [
              // Resumen con chips
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Icon(Icons.task_alt, size: 48, color: Colors.green),
                    const SizedBox(height: 16),
                    Text(
                      'ID: ${user.id}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Nombre: ${user.name}',
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Usuario: ${user.username}',
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Email: ${user.email}',
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Chip(
                      label: Text(user.website),
                      backgroundColor: Colors.green[100],
                    ),
                  ],
                ),
              ),
              // Lista de todos
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, i) {
                    final u = users[i];
                    return ListTile(
                      leading: CircleAvatar(child: Text('${u.id}')),
                      title: Text(u.name),
                      subtitle: Text('${u.username}\n${u.email}'),
                      trailing: Text(u.website),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
