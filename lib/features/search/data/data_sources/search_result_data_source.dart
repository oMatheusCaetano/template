import 'package:template/core/data/data_sources/data_source.dart';
import 'package:template/features/search/data/models/search_result_model.dart';

abstract class SearchResultDataSource extends DataSource {
  Future<List<SearchResultModel>> searchByText(String textToSearch);
}
