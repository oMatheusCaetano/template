import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:template/features/search/data/data_sources/search_result_data_source.dart';
import 'package:template/features/search/data/models/search_result_model.dart';
import 'package:template/features/search/data/repositories/search_result_repository_impl.dart';

class SearchResultDataSourceMock extends Mock
    implements SearchResultDataSource {}

main() {
  final dataSource = SearchResultDataSourceMock();
  final repository = SearchResultRepositoryImpl(dataSource);

  test('Should Return a "SeachResult" list', () async {
    when(() => dataSource.searchByText(any())).thenAnswer((_) async => <SearchResultModel>[]);
    final result = await repository.searchByText('Text To Search');
    expect(result.isRight(), true);
    expect(result | [], isA<List<SearchResultModel>>());
  });
}
