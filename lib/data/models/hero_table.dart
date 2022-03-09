import 'package:dota/data/models/hero_model.dart';
import 'package:equatable/equatable.dart';

class HeroTable extends Equatable {
  final int id;
  final String? localizeName;
  final String? primaryAttr;
  final String? img;
  final String? icon;
  final String? attackType;
  final int? baseHealth;
  final int? baseAttackMin;
  final int? baseAttackMax;
  final int? moveSpeed;
  final int? baseMana;

  const HeroTable(
      {required this.id,
      required this.localizeName,
      required this.primaryAttr,
      required this.img,
      required this.icon,
      required this.attackType,
      required this.baseHealth,
      required this.baseAttackMin,
      required this.baseAttackMax,
      required this.moveSpeed,
      required this.baseMana});

  factory HeroTable.fromEntity(HeroModel heroModel) {
    return HeroTable(
        id: heroModel.id,
        localizeName: heroModel.localizedName,
        primaryAttr: heroModel.primaryAttr.toString(),
        img: heroModel.img,
        icon: heroModel.icon,
        attackType: heroModel.attackType.toString(),
        baseHealth: heroModel.baseHealth ?? 0,
        baseAttackMin: heroModel.baseAttackMin ?? 0,
        baseAttackMax: heroModel.baseAttackMax ?? 0,
        moveSpeed: heroModel.moveSpeed,
        baseMana: heroModel.baseMana);
  }

  factory HeroTable.fromMap(Map<String, dynamic> map) => HeroTable(
      id: map['id'],
      localizeName: map['localized_name'],
      primaryAttr: map['primary_attr'],
      img: map['img'],
      icon: map['icon'],
      attackType: map['attack_type'],
      baseHealth: map['base_health'],
      baseAttackMin: map['base_attack_min'],
      baseAttackMax: map['base_attack_max'],
      moveSpeed: map['move_speed'],
      baseMana: map['base_mana']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'localized_name': localizeName,
        'primary_attr': primaryAttr,
        'img': img,
        'icon': icon,
        'attack_type': attackType,
        'base_health': baseHealth,
        'base_attack_min': baseAttackMin,
        'base_attack_max': baseAttackMax,
        'move_speed': moveSpeed,
        'base_mana': baseMana
      };

  @override
  List<Object?> get props => [
        id,
        localizeName,
        primaryAttr,
        img,
        icon,
        attackType,
        baseHealth,
        baseAttackMin,
        baseAttackMax,
        moveSpeed,
        baseMana
      ];
}
