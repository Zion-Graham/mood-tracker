import 'package:flutter/material.dart';

class DismissAlert extends StatelessWidget {
  const DismissAlert({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Confirm"),
      content: const Text("Are you sure you wish to delete this entry?"),
      actions: <Widget>[
        FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text("DELETE")),
        FlatButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text("CANCEL"),
        ),
      ],
    );
  }
}
