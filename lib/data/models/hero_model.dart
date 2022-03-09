import 'package:equatable/equatable.dart';

class HeroModel extends Equatable {
  HeroModel({
    required this.id,
    required this.name,
    required this.localizedName,
    required this.primaryAttr,
    required this.attackType,
    required this.roles,
    required this.img,
    required this.icon,
    required this.baseHealth,
    required this.baseHealthRegen,
    required this.baseMana,
    required this.baseManaRegen,
    required this.baseArmor,
    required this.baseMr,
    required this.baseAttackMin,
    required this.baseAttackMax,
    required this.baseStr,
    required this.baseAgi,
    required this.baseInt,
    required this.strGain,
    required this.agiGain,
    required this.intGain,
    required this.attackRange,
    required this.projectileSpeed,
    required this.attackRate,
    required this.moveSpeed,
    required this.turnRate,
    required this.cmEnabled,
    required this.legs,
    required this.heroId,
    required this.turboPicks,
    required this.turboWins,
    required this.proBan,
    required this.proWin,
    required this.proPick,
    required this.the1Pick,
    required this.the1Win,
    required this.the2Pick,
    required this.the2Win,
    required this.the3Pick,
    required this.the3Win,
    required this.the4Pick,
    required this.the4Win,
    required this.the5Pick,
    required this.the5Win,
    required this.the6Pick,
    required this.the6Win,
    required this.the7Pick,
    required this.the7Win,
    required this.the8Pick,
    required this.the8Win,
    required this.nullPick,
    required this.nullWin,
  });

  int id;
  String name;
  String localizedName;
  String? primaryAttr;
  String? attackType;
  List<String> roles;
  String img;
  String icon;
  int? baseHealth;
  double baseHealthRegen;
  int? baseMana;
  double baseManaRegen;
  double baseArmor;
  int? baseMr;
  int? baseAttackMin;
  int? baseAttackMax;
  int? baseStr;
  int? baseAgi;
  int? baseInt;
  double strGain;
  double agiGain;
  double intGain;
  int? attackRange;
  int projectileSpeed;
  double attackRate;
  int moveSpeed;
  double? turnRate;
  bool cmEnabled;
  int? legs;
  int? heroId;
  int? turboPicks;
  int? turboWins;
  int? proBan;
  int? proWin;
  int? proPick;
  int? the1Pick;
  int? the1Win;
  int? the2Pick;
  int? the2Win;
  int? the3Pick;
  int? the3Win;
  int? the4Pick;
  int? the4Win;
  int? the5Pick;
  int? the5Win;
  int? the6Pick;
  int? the6Win;
  int? the7Pick;
  int? the7Win;
  int? the8Pick;
  int? the8Win;
  int? nullPick;
  int? nullWin;

  factory HeroModel.fromJson(Map<String, dynamic> json) => HeroModel(
        id: json["id"],
        name: json["name"],
        localizedName: json["localized_name"],
        primaryAttr: json["primary_attr"],
        attackType: json["attack_type"],
        roles: List<String>.from(json["roles"]),
        img: json["img"],
        icon: json["icon"],
        baseHealth: json["base_health"],
        baseHealthRegen: json["base_health_regen"]?.toDouble(),
        baseMana: json["base_mana"],
        baseManaRegen: json["base_mana_regen"]?.toDouble(),
        baseArmor: json["base_armor"]?.toDouble(),
        baseMr: json["base_mr"],
        baseAttackMin: json["base_attack_min"],
        baseAttackMax: json["base_attack_max"],
        baseStr: json["base_str"],
        baseAgi: json["base_agi"],
        baseInt: json["base_int"],
        strGain: json["str_gain"]?.toDouble(),
        agiGain: json["agi_gain"]?.toDouble(),
        intGain: json["int_gain"]?.toDouble(),
        attackRange: json["attack_range"],
        projectileSpeed: json["projectile_speed"],
        attackRate: json["attack_rate"]?.toDouble(),
        moveSpeed: json["move_speed"],
        turnRate: json["turn_rate"]?.toDouble(),
        cmEnabled: json["cm_enabled"],
        legs: json["legs"],
        heroId: json["hero_id"],
        turboPicks: json["turbo_picks"],
        turboWins: json["turbo_wins"],
        proBan: json["pro_ban"],
        proWin: json["pro_win"],
        proPick: json["pro_pick"],
        the1Pick: json["1_pick"],
        the1Win: json["1_win"],
        the2Pick: json["2_pick"],
        the2Win: json["2_win"],
        the3Pick: json["3_pick"],
        the3Win: json["3_win"],
        the4Pick: json["4_pick"],
        the4Win: json["4_win"],
        the5Pick: json["5_pick"],
        the5Win: json["5_win"],
        the6Pick: json["6_pick"],
        the6Win: json["6_win"],
        the7Pick: json["7_pick"],
        the7Win: json["7_win"],
        the8Pick: json["8_pick"],
        the8Win: json["8_win"],
        nullPick: json["null_pick"],
        nullWin: json["null_win"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "localized_name": localizedName,
        "primary_attr": primaryAttr,
        "attack_type": attackType,
        "roles": List<String>.from(roles),
        "img": img,
        "icon": icon,
        "base_health": baseHealth,
        "base_health_regen": baseHealthRegen,
        "base_mana": baseMana,
        "base_mana_regen": baseManaRegen,
        "base_armor": baseArmor,
        "base_mr": baseMr,
        "base_attack_min": baseAttackMin,
        "base_attack_max": baseAttackMax,
        "base_str": baseStr,
        "base_agi": baseAgi,
        "base_int": baseInt,
        "str_gain": strGain,
        "agi_gain": agiGain,
        "int_gain": intGain,
        "attack_range": attackRange,
        "projectile_speed": projectileSpeed,
        "attack_rate": attackRate,
        "move_speed": moveSpeed,
        "turn_rate": turnRate,
        "cm_enabled": cmEnabled,
        "legs": legs,
        "hero_id": heroId,
        "turbo_picks": turboPicks,
        "turbo_wins": turboWins,
        "pro_ban": proBan,
        "pro_win": proWin,
        "pro_pick": proPick,
        "1_pick": the1Pick,
        "1_win": the1Win,
        "2_pick": the2Pick,
        "2_win": the2Win,
        "3_pick": the3Pick,
        "3_win": the3Win,
        "4_pick": the4Pick,
        "4_win": the4Win,
        "5_pick": the5Pick,
        "5_win": the5Win,
        "6_pick": the6Pick,
        "6_win": the6Win,
        "7_pick": the7Pick,
        "7_win": the7Win,
        "8_pick": the8Pick,
        "8_win": the8Win,
        "null_pick": nullPick,
        "null_win": nullWin,
      };

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
