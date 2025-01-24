import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:task/groups/groups.dart';

class AddUpdateGroupDialog extends StatefulWidget {
  const AddUpdateGroupDialog({super.key, this.groupStore});
  final GroupStore? groupStore;

  @override
  State<AddUpdateGroupDialog> createState() => _AddUpdateGroupDialogState();
}

class _AddUpdateGroupDialogState extends State<AddUpdateGroupDialog> {
  late final _groupStore = widget.groupStore ?? GroupStore();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            initialValue: _groupStore.name,
            onChanged: _groupStore.setName,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          SizedBox(height: 8.0),
          TextFormField(
            initialValue: _groupStore.description,
            onChanged: _groupStore.setDescription,
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
          ),
          SizedBox(height: 8.0),
          Observer(
            builder: (context) {
              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                value: _groupStore.showDivisionReport,
                onChanged: _groupStore.setShowDivisionReport,
                title: const Text('Show Division Report'),
              );
            },
          ),
          SizedBox(height: 8.0),
          Observer(
            builder: (context) {
              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                value: _groupStore.isActive,
                onChanged: _groupStore.setIsActive,
                title: const Text('Is Active'),
              );
            },
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: Text('Cancel'),
              ),
              SizedBox(width: 10),
              Observer(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: _groupStore.isSavePending ? null : _saveGroup,
                    child: widget.groupStore != null
                        ? Text('Update')
                        : Text('Add'),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _saveGroup() async {
    try {
      Navigator.of(context).pop(await _groupStore.saveGroup());
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
