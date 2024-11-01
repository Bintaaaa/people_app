import 'package:main_domain/data/models/user_data_dto.dart';

class ListUserModelDTO {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<UserDataDTO>? data;

  const ListUserModelDTO({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  factory ListUserModelDTO.fromJson(Map<String, dynamic> json) => ListUserModelDTO(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: json["data"] == null ? [] : List<UserDataDTO>.from(json["data"]!.map((x) => UserDataDTO.fromJson(x))),
      );
}
