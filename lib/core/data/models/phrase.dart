import 'package:json_annotation/json_annotation.dart';

part 'phrase.g.dart';

@JsonSerializable()
class Phrase {
  String? id;
  String? content;
  String? phraseMaster;

  Phrase({this.id, this.content, this.phraseMaster});

  factory Phrase.fromJson(Map<String, dynamic> json) => _$PhraseFromJson(json);

  Map<String, dynamic> toJson() => _$PhraseToJson(this);
}

@JsonSerializable()
class PhraseResponse {
  Phrase? data;

  PhraseResponse({this.data});

  factory PhraseResponse.fromJson(Map<String, dynamic> json) => _$PhraseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PhraseResponseToJson(this);
}
