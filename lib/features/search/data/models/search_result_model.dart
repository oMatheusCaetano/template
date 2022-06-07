import 'dart:convert';

import 'package:template/features/search/domain/entities/search_result.dart';

class SearchResultModel extends SearchResult {
  SearchResultModel({
    required String id,
    required String imgUrl,
    required String title,
    required String content,
  }) : super(id: id, imgUrl: imgUrl, title: title, content: content);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imgUrl': imgUrl,
      'title': title,
      'content': content,
    };
  }

  factory SearchResultModel.fromMap(Map<String, dynamic> map) {
    return SearchResultModel(
      id: map['id'] as String,
      imgUrl: map['imgUrl'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchResultModel.fromJson(String source) => SearchResultModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
