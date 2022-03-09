import 'package:dartz/dartz.dart';
import 'package:dota/domain/usecase/get_recommendation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late GetRecommendation usecase;
  late MockHeroRepository mockHeroRepository;

  setUp(() {
    mockHeroRepository = MockHeroRepository();
    usecase = GetRecommendation(mockHeroRepository);
  });

  test('should get similar heroes', () async {
    when(mockHeroRepository.getRecommendation(1, 'agi', 3))
        .thenAnswer((_) async => Right(testListHeroes));
    // act
    final result = await usecase.execute(1, 'agi', 3);
    // assert
    expect(result, Right(testListHeroes));
  });
}
