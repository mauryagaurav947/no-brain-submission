import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:task/groups/groups.dart';

class GroupsHomePage extends StatefulWidget {
  const GroupsHomePage({super.key});

  @override
  State<GroupsHomePage> createState() => _GroupsHomePageState();
}

class _GroupsHomePageState extends State<GroupsHomePage> {
  final _pagingController = PagingController<int, GroupModel>(firstPageKey: 1);
  final _groupRepository = GroupsRepository();

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener(_fetchPage);
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Types'),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: PagedListView(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<GroupModel>(
            itemBuilder: (context, group, index) {
              return GroupTile(
                index: index,
                group: group,
                controller: _pagingController,
              );
            },
            firstPageProgressIndicatorBuilder: (_) => Center(
              child: const CircularProgressIndicator(),
            ),
            newPageProgressIndicatorBuilder: (_) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: const CircularProgressIndicator(),
              ),
            ),
            noItemsFoundIndicatorBuilder: (_) => const Text('No groups found'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addGroupType,
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _onRefresh() async {
    _pagingController.refresh();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await _groupRepository.fetchGroups(
        page: pageKey,
        pageSize: 20,
      );
      final isLastPage = newItems.length < 20;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } on GroupExceptions catch (error) {
      _pagingController.error = error.message;
    } catch (error) {
      _pagingController.error = error;
    }
  }

  void _addGroupType() async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title: const Text('Add Group'),
          content: const AddUpdateGroupDialog(),
        );
      },
    );
    if (result != null && result is GroupModel) {
      _pagingController.refresh();
    }
  }
}
