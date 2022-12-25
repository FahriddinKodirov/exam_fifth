class UsersModel {
  int id;
  String username;
  String name;
  String state;
  String avatar_url;
 

  UsersModel({
    required this.id,
    required this.username,
    required this.name,
    required this.state,
    required this.avatar_url,
  });

  factory UsersModel.fromJson(Map<String, dynamic> jsonData) {
    return UsersModel(
      id: jsonData['id'] as int? ?? 0,
      username: jsonData['username'] as String? ?? '',
      name: jsonData['name'] as String? ?? '',
      state: jsonData['state'] as String? ?? '',
      avatar_url: jsonData['avatar_url'] as String? ?? '',
     
    );
  }
}