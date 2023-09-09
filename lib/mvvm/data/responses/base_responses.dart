
import 'package:json_annotation/json_annotation.dart';

part 'base_responses.g.dart';


@JsonSerializable()
class BaseResponse{
  @JsonKey(name:"status")
  int? status;
  String? message;


}