import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:task/groups/groups.dart';

class GroupExceptions implements Exception {
  final String message;

  GroupExceptions(this.message);

  @override
  String toString() {
    return message;
  }
}

class GroupsRepository {
  final _client = Client();
  final _baseUrl = 'dev.api.teaqip.nobrainsolutions.com';
  final _apiVersion = 'v1';

  Future<List<GroupModel>> fetchGroups({
    String? orderBy,
    bool? descending,
    int? page,
    int? pageSize,
    int? sync,
    int? totalRows,
    String? query,
    bool? all,
    bool? isActive,
  }) async {
    final queryParameters = <String, String>{
      if (orderBy != null) 'OrderBy': orderBy,
      if (descending != null) 'IsDescending': descending.toString(),
      if (page != null) 'Page': page.toString(),
      if (pageSize != null) 'PageSize': pageSize.toString(),
      if (sync != null) 'Sync': sync.toString(),
      if (totalRows != null) 'TotalRows': totalRows.toString(),
      if (query != null) 'Query': query,
      if (all != null) 'All': all.toString(),
      if (isActive != null) 'IsActive': isActive.toString(),
    };

    final uri = Uri.http(_baseUrl, '$_apiVersion/group-types', queryParameters);
    final response = await _client.get(uri);
    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      final data = jsonResponse['Data'];
      if (page != data['Page']) {
        throw GroupExceptions('Failed to load groups');
      }
      return GroupModel.fromMapList(data['Rows']);
    } else {
      throw GroupExceptions('Failed to load groups');
    }
  }

  Future<int> createGroup(GroupModel group) async {
    final uri = Uri.http(_baseUrl, '$_apiVersion/group-types');
    final response = await _client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(group.toJson()),
    );
    if (response.statusCode != HttpStatus.created) {
      throw GroupExceptions('Failed to create group');
    }
    final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
    return jsonResponse['Data'];
  }

  Future<void> updateGroup(GroupModel group) async {
    final uri = Uri.http(_baseUrl, '$_apiVersion/group-types/${group.id}');
    final response = await _client.patch(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(group.toJson()..remove('id')),
    );
    if (response.statusCode != HttpStatus.ok) {
      throw GroupExceptions('Failed to update group');
    }
  }
}
