import 'package:dartz/dartz.dart';

import 'package:template/core/domain/errors/base_exception.dart';
import 'package:template/core/domain/repositories/repository.dart';

import 'package:template/features/search/domain/entities/search_result.dart';

abstract class SearchResultRepository extends Repository {
  Future<Either<BaseException, List<SearchResult>>> searchByText(String textToSearch);
}
