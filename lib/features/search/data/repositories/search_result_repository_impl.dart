import 'package:dartz/dartz.dart';
import 'package:template/core/data/repositories/repository_impl.dart';

import 'package:template/core/domain/errors/base_exception.dart';
import 'package:template/features/search/data/data_sources/search_result_data_source.dart';

import 'package:template/features/search/domain/entities/search_result.dart';
import 'package:template/features/search/domain/repositories/search_result_repository.dart';

class SearchResultRepositoryImpl extends RepositoryImpl
    implements SearchResultRepository {
  final SearchResultDataSource dataSource;

  SearchResultRepositoryImpl(this.dataSource);

  @override
  Future<Either<BaseException, List<SearchResult>>> searchByText(
    String textToSearch,
  ) async {
    try {
      final result = await dataSource.searchByText(textToSearch);
      return Right(result);
    } catch (e) {
      return Left(BaseException());
    }
  }
}
