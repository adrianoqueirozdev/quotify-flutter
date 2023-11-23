// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phrase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Phrase _$PhraseFromJson(Map<String, dynamic> json) => Phrase(
      id: json['id'] as String?,
      content: json['content'] as String?,
      phraseMaster: json['phraseMaster'] as String?,
    );

Map<String, dynamic> _$PhraseToJson(Phrase instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'phraseMaster': instance.phraseMaster,
    };

PhraseResponse _$PhraseResponseFromJson(Map<String, dynamic> json) =>
    PhraseResponse(
      data: json['data'] == null
          ? null
          : Phrase.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhraseResponseToJson(PhraseResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
