import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pendientes_app/providers/pendiente_provider.dart';

import 'package:pendientes_app/models/pendiente.dart';

import 'package:pendientes_app/widgets/pendiente_form.dart';

class NewPendiente extends StatefulWidget {
  @override
  _NewPendientState createState() => _NewPendientState();
}

class _NewPendientState extends State<NewPendiente> {
  final _formKey = GlobalKey<FormState>();

  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nuevo Pendiente',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                )),
            SizedBox(height: 8),
            PendienteFormWidget(
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSaved: addPendient,
            ),
          ],
        ),
      ),
    );
  }

  void addPendient() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final pendiente = Pendiente(
        createdTime: DateTime.now(),
        title: title,
        id: DateTime.now().toString(),
        description: description,
      );

      final provider = Provider.of<PendienteProvider>(context, listen: false);
      provider.addPendiente(pendiente);

      Navigator.of(context).pop();
    }
  }
}
