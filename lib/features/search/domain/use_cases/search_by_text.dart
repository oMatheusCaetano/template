import 'package:dartz/dartz.dart';

import 'package:template/core/domain/errors/base_exception.dart';
import 'package:template/core/domain/use_cases/use_case.dart';

import 'package:template/features/search/domain/entities/search_result.dart';

abstract class SearchByText extends UseCase {
  Future<Either<BaseException, List<SearchResult>>> call(String textToSearch);
}
