class TodoDto {
  final int id;
  final String title;
  final bool completed;

  const TodoDto({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoDto.fromJson(Map<String, dynamic> json) => TodoDto(
    id:        json['id']        as int,
    title:     json['title']     as String, 
    completed: json['completed'] as bool,
  );
}

class UserDto {
  final int id;
  final String name;
  final String username;
  final String email;
  final String website;

  const UserDto({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.website,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
    id:       json['id']       as int,
    name:     json['name']     as String, 
    username: json['username'] as String, 
    email:    json['email']    as String, 
    website:  json['website']  as String, 
  );
}