class Character {
  late String name;
  late String purpose;
  late bool enemy;

  Character({required this.name, required this.purpose, required this.enemy});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['Name'],
      purpose: json['Purpose'],
      enemy: json['Enemy'],
    );
  }
}
