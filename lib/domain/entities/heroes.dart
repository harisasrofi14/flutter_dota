import 'package:equatable/equatable.dart';

class Heroes extends Equatable {
  int? id;
  String localizedName;
  String? primaryAttr;
  String? attackType;
  List<String> roles;
  String img;
  String icon;
  int? baseHealth;
  int? baseAttackMin;
  int? baseAttackMax;
  int? moveSpeed;
  int? baseMana;

  Heroes(
      {required this.id,
      required this.localizedName,
      required this.primaryAttr,
      required this.attackType,
      required this.roles,
      required this.img,
      required this.icon,
      required this.baseHealth,
      required this.baseAttackMin,
      required this.baseAttackMax,
      required this.moveSpeed,
      required this.baseMana});

  @override
  List<Object?> get props => [
        id,
        localizedName,
        primaryAttr,
        attackType,
        roles,
        img,
        icon,
        baseHealth,
        baseAttackMin,
        baseAttackMax,
        moveSpeed,
        baseMana
      ];
}
