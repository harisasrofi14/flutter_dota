import 'package:dartz/dartz.dart';
import 'package:dota/domain/usecase/get_filtered_heroes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late GetFilteredHeroes usecase;
  late MockHeroRepository mockHeroRepository;

  setUp(() {
    mockHeroRepository = MockHeroRepository();
    usecase = GetFilteredHeroes(mockHeroRepository);
  });
  const tRole = 'Carry';
  test('should get all filtered heroes', () async {
    when(mockHeroRepository.getAllFilteredHeroes(tRole))
        .thenAnswer((_) async => Right(testListHeroes));
    // act
    final result = await usecase.execute(tRole);
    // assert
    expect(result, Right(testListHeroes));
  });
}
