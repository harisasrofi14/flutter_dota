import 'package:equatable/equatable.dart';

class RolesTable extends Equatable {
  final int id;
  final String role;

  const RolesTable({
    required this.id,
    required this.role,
  });

  factory RolesTable.fromEntity(int id, String role) {
    return RolesTable(
      id: id,
      role: role,
    );
  }

  factory RolesTable.fromMap(Map<String, dynamic> map) => RolesTable(
        id: map['id'],
        role: map['role'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'role': role,
      };

  @override
  List<Object?> get props => [id, role];
}
