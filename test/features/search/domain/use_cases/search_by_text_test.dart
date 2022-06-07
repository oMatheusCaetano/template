import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:template/features/search/domain/entities/search_result.dart';
import 'package:template/features/search/domain/repositories/search_result_repository.dart';
import 'package:template/features/search/domain/use_cases/implementations/search_by_text_impl.dart';

class SearchResultRepositoryMock extends Mock
    implements SearchResultRepository {}

main() {
  final repository = SearchResultRepositoryMock();
  final useCase = SearchByTextImpl(repository);

  test('Should return a "SearchResult" List', () async {
    when(() => repository.searchByText(any())).thenAnswer((_) async => Right(<SearchResult>[]));
    final result = await useCase('Text To Search');
    expect(result.isRight(), true);
    expect(result | [], isA<List<SearchResult>>());
  });
}
