import 'package:dartz/dartz.dart';
import 'package:dota/domain/usecase/get_all_heroes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late GetAllHeroes usecase;
  late MockHeroRepository mockHeroRepository;

  setUp(() {
    mockHeroRepository = MockHeroRepository();
    usecase = GetAllHeroes(mockHeroRepository);
  });
  test('should get all heroes', () async {
    when(mockHeroRepository.getAllHeroes())
        .thenAnswer((_) async => Right(testListHeroes));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(testListHeroes));
  });
}
