import 'package:mobx/mobx.dart';
import 'package:task/groups/models/models.dart';
import 'package:task/groups/repository/repository.dart';

part 'group_store.g.dart';

class GroupStore = _GroupStore with _$GroupStore;

abstract class _GroupStore with Store {
  final _groupRepository = GroupsRepository();
  int? id;

  @observable
  String name = '';

  @action
  void setName(String value) {
    name = value;
  }

  @observable
  String description = '';

  @action
  void setDescription(String value) {
    description = value;
  }

  @observable
  bool showDivisionReport = false;

  @action
  void setShowDivisionReport(bool? value) {
    if (value != null) {
      showDivisionReport = value;
    }
  }

  @observable
  bool isActive = false;

  @action
  void setIsActive(bool? value) {
    if (value != null) {
      isActive = value;
    }
  }

  @computed
  bool get isValid => name.isNotEmpty && description.isNotEmpty;

  @action
  void setGroupData(GroupModel group) {
    id = group.id;
    name = group.name ?? '';
    description = group.description ?? '';
    showDivisionReport = group.showDivisionReport ?? false;
    isActive = group.isActive ?? false;
  }

  @observable
  ObservableFuture<GroupModel>? _saveFuture;

  @computed
  bool get isSavePending =>
      _saveFuture != null && _saveFuture!.status == FutureStatus.pending;

  @action
  Future<GroupModel?> saveGroup() async {
    if (!isValid) {
      throw Exception('Invalid group data');
    }

    final group = GroupModel(
      id: id,
      name: name,
      description: description,
      showDivisionReport: showDivisionReport,
      isActive: isActive,
    );

    _saveFuture = ObservableFuture(_saveGroup(group));
    return await _saveFuture;
  }

  Future<GroupModel> _saveGroup(GroupModel group) async {
    if (id == null) {
      final data = await _groupRepository.createGroup(group);
      return group.copyWith(id: data);
    } else {
      await _groupRepository.updateGroup(group);
      return group;
    }
  }
}
