import 'package:dartz/dartz.dart';

import 'package:template/core/domain/errors/base_exception.dart';
import 'package:template/core/domain/use_cases/implementations/use_case_impl.dart';

import 'package:template/features/search/domain/entities/search_result.dart';
import 'package:template/features/search/domain/repositories/search_result_repository.dart';
import 'package:template/features/search/domain/use_cases/search_by_text.dart';

class SearchByTextImpl extends UseCaseImpl implements SearchByText {
  final SearchResultRepository repository;

  SearchByTextImpl(this.repository);

  Future<Either<BaseException, List<SearchResult>>> call(String textToSearch) {
    return repository.searchByText(textToSearch);
  }
}
