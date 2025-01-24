import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:task/groups/groups.dart';

class GroupTile extends StatefulWidget {
  const GroupTile({
    super.key,
    required this.index,
    required this.group,
    required this.controller,
  });
  final int index;
  final GroupModel group;
  final PagingController<int, GroupModel> controller;

  @override
  State<GroupTile> createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  final _groupStore = GroupStore();

  @override
  void initState() {
    super.initState();
    _groupStore.setGroupData(widget.group);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: widget.index.isEven ? Colors.white : Colors.grey[200],
      title: Observer(
        builder: (context) {
          return Text(
            _groupStore.name,
            maxLines: 1,
          );
        },
      ),
      subtitle: Observer(
        builder: (context) {
          return Text(
            _groupStore.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          );
        },
      ),
      onTap: () async {
        final result = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog.adaptive(
              title: const Text('Update Group'),
              content: AddUpdateGroupDialog(
                groupStore: _groupStore,
              ),
            );
          },
        );
        if (result != null && result is GroupModel) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Group added successfully'),
            ),
          );
          widget.controller.itemList![widget.index] = result;
        }
      },
    );
  }
}
