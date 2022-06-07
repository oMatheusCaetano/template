import 'package:dartz/dartz.dart';
import 'package:template/core/data/data_sources/implementations/data_source_impl.dart';
import 'package:template/core/domain/errors/base_exception.dart';
import 'package:template/features/search/data/data_sources/search_result_data_source.dart';
import 'package:template/features/search/data/models/search_result_model.dart';

class SearchResultDataSourceImpl extends DataSourceImpl
    implements SearchResultDataSource {
  Future<List<SearchResultModel>> searchByText(
      String textToSearch) {
    return Future.delayed(
      Duration(seconds: 2), 
      () => <SearchResultModel>[],
    );
  }
}
