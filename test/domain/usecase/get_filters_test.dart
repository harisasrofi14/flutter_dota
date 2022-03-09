import 'package:dartz/dartz.dart';
import 'package:dota/domain/usecase/get_filters.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late GetAllFilters usecase;
  late MockHeroRepository mockHeroRepository;

  setUp(() {
    mockHeroRepository = MockHeroRepository();
    usecase = GetAllFilters(mockHeroRepository);
  });

  test('should get all filters', () async {
    when(mockHeroRepository.getAllFilter())
        .thenAnswer((_) async => Right(testListFilters));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(testListFilters));
  });
}
