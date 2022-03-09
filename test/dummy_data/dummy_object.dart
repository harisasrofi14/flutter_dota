import 'package:dota/data/models/filter_model.dart';
import 'package:dota/data/models/hero_model.dart';
import 'package:dota/data/models/hero_table.dart';
import 'package:dota/data/models/roles_table.dart';
import 'package:dota/domain/entities/filters.dart';
import 'package:dota/domain/entities/heroes.dart';

final testHero = HeroModel(
    id: 1,
    name: 'npc_dota_hero_antimage',
    localizedName: 'Anti-Mage',
    primaryAttr: 'agi',
    attackType: 'Melee',
    roles: const ["Carry", "Escape", "Nuker"],
    img: "/apps/dota2/images/dota_react/heroes/antimage.png?",
    icon: "/apps/dota2/images/dota_react/heroes/icons/antimage.png?",
    baseHealth: 200,
    baseHealthRegen: 0.25,
    baseMana: 75,
    baseManaRegen: 0,
    baseArmor: 0,
    baseMr: 75,
    baseAttackMin: 29,
    baseAttackMax: 33,
    baseStr: 21,
    baseAgi: 24,
    baseInt: 12,
    strGain: 1.6,
    agiGain: 2.8,
    intGain: 1.8,
    attackRange: 150,
    projectileSpeed: 0,
    attackRate: 1.4,
    moveSpeed: 310,
    turnRate: null,
    cmEnabled: true,
    legs: 2,
    heroId: 1,
    turboPicks: 1533385,
    turboWins: 77643,
    proBan: 417,
    proWin: 62,
    proPick: 132,
    the1Pick: 12321,
    the1Win: 12345,
    the2Pick: 12345,
    the2Win: 09773,
    the3Pick: 54444,
    the3Win: 12345,
    the4Pick: 38334,
    the4Win: 99882,
    the5Pick: 1223,
    the5Win: 55532,
    the6Pick: 123213,
    the6Win: 12133,
    the7Pick: 312321,
    the7Win: 31233,
    the8Pick: 12344,
    the8Win: 11113,
    nullPick: 2100942,
    nullWin: 0);

final testListHero = [testHero];

const testHeroTable = HeroTable(
    id: 1,
    localizeName: 'Anti-Mage',
    primaryAttr: 'agi',
    img: '/apps/dota2/images/dota_react/heroes/antimage.png?',
    icon: '/apps/dota2/images/dota_react/heroes/icons/antimage.png?',
    attackType: 'Melee',
    baseHealth: 200,
    baseAttackMin: 29,
    baseAttackMax: 33,
    moveSpeed: 100,
    baseMana: 50);

final testListHeroTable = [testHeroTable];

const testHeroTableMap = {
  'id': 1,
  'localizeName': 'Anti-Mage',
  'primaryAttr': 'agi',
  'img': '/apps/dota2/images/dota_react/heroes/antimage.png?',
  'icon': '/apps/dota2/images/dota_react/heroes/icons/antimage.png?',
  'attackType': 'Melee',
  'baseHealth': 200,
  'baseAttackMin': 29,
  'baseAttackMax': 33,
  'moveSpeed': 100,
  'baseMana': 50
};

const listTableMap = [
  {
    'id': 1,
    'localizeName': 'Anti-Mage',
    'primaryAttr': 'agi',
    'img': '/apps/dota2/images/dota_react/heroes/antimage.png?',
    'icon': '/apps/dota2/images/dota_react/heroes/icons/antimage.png?',
    'attackType': 'Melee',
    'baseHealth': 200,
    'baseAttackMin': 29,
    'baseAttackMax': 33,
    'moveSpeed': 100,
    'baseMana': 50
  }
];

final heroes = Heroes(
    id: 1,
    localizedName: 'Anti-Mage',
    primaryAttr: 'agi',
    img: '/apps/dota2/images/dota_react/heroes/antimage.png?',
    icon: '/apps/dota2/images/dota_react/heroes/icons/antimage.png?',
    attackType: 'Melee',
    baseHealth: 200,
    baseAttackMin: 29,
    baseAttackMax: 33,
    moveSpeed: 100,
    baseMana: 50,
    roles: ['Carry']);

final testListHeroes = [heroes];

const testRolesTable = RolesTable(id: 1, role: "Carry");

final testHeroRoleTable = [testRolesTable];

const testListRoleTable = [
  {'id': 1, 'role': 'Carry'},
  {'id': 2, 'role': 'Carry'}
];

const testHeroFilter = HeroFilter('Carry');
final testFilters = Filters('Carry', false);
final testListHeroFilters = [testHeroFilter];
final testListFilters = [testFilters];
const testListHeroFilter = [
  {'role': 'Carry'}
];
