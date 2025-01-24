// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GroupStore on _GroupStore, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??=
          Computed<bool>(() => super.isValid, name: '_GroupStore.isValid'))
      .value;
  Computed<bool>? _$isSavePendingComputed;

  @override
  bool get isSavePending =>
      (_$isSavePendingComputed ??= Computed<bool>(() => super.isSavePending,
              name: '_GroupStore.isSavePending'))
          .value;

  late final _$nameAtom = Atom(name: '_GroupStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_GroupStore.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$showDivisionReportAtom =
      Atom(name: '_GroupStore.showDivisionReport', context: context);

  @override
  bool get showDivisionReport {
    _$showDivisionReportAtom.reportRead();
    return super.showDivisionReport;
  }

  @override
  set showDivisionReport(bool value) {
    _$showDivisionReportAtom.reportWrite(value, super.showDivisionReport, () {
      super.showDivisionReport = value;
    });
  }

  late final _$isActiveAtom =
      Atom(name: '_GroupStore.isActive', context: context);

  @override
  bool get isActive {
    _$isActiveAtom.reportRead();
    return super.isActive;
  }

  @override
  set isActive(bool value) {
    _$isActiveAtom.reportWrite(value, super.isActive, () {
      super.isActive = value;
    });
  }

  late final _$_saveFutureAtom =
      Atom(name: '_GroupStore._saveFuture', context: context);

  @override
  ObservableFuture<GroupModel>? get _saveFuture {
    _$_saveFutureAtom.reportRead();
    return super._saveFuture;
  }

  @override
  set _saveFuture(ObservableFuture<GroupModel>? value) {
    _$_saveFutureAtom.reportWrite(value, super._saveFuture, () {
      super._saveFuture = value;
    });
  }

  late final _$saveGroupAsyncAction =
      AsyncAction('_GroupStore.saveGroup', context: context);

  @override
  Future<GroupModel?> saveGroup() {
    return _$saveGroupAsyncAction.run(() => super.saveGroup());
  }

  late final _$_GroupStoreActionController =
      ActionController(name: '_GroupStore', context: context);

  @override
  void setName(String value) {
    final _$actionInfo =
        _$_GroupStoreActionController.startAction(name: '_GroupStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_GroupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_GroupStoreActionController.startAction(
        name: '_GroupStore.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_GroupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowDivisionReport(bool? value) {
    final _$actionInfo = _$_GroupStoreActionController.startAction(
        name: '_GroupStore.setShowDivisionReport');
    try {
      return super.setShowDivisionReport(value);
    } finally {
      _$_GroupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsActive(bool? value) {
    final _$actionInfo = _$_GroupStoreActionController.startAction(
        name: '_GroupStore.setIsActive');
    try {
      return super.setIsActive(value);
    } finally {
      _$_GroupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGroupData(GroupModel group) {
    final _$actionInfo = _$_GroupStoreActionController.startAction(
        name: '_GroupStore.setGroupData');
    try {
      return super.setGroupData(group);
    } finally {
      _$_GroupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
description: ${description},
showDivisionReport: ${showDivisionReport},
isActive: ${isActive},
isValid: ${isValid},
isSavePending: ${isSavePending}
    ''';
  }
}
