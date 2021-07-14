import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pendientes_app/models/pendiente.dart';

import 'package:pendientes_app/widgets/pendiente_form.dart';

import 'package:pendientes_app/providers/pendiente_provider.dart';

class EditPendientePage extends StatefulWidget {
  final Pendiente pendiente;

  const EditPendientePage({
    Key? key,
    required this.pendiente,
  }) : super(key: key);

  @override
  _EditPendientePageState createState() => _EditPendientePageState();
}

class _EditPendientePageState extends State<EditPendientePage> {
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String description;

  @override
  void initState() {
    title = widget.pendiente.title;
    description = widget.pendiente.description;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Editando pendiente',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: PendienteFormWidget(
            title: title,
            description: description,
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
            onSaved: savePendiente,
          ),
        ),
      ),
    );
  }

  void savePendiente() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<PendienteProvider>(context, listen: false);
      provider.updatePendiente(widget.pendiente, title, description);

      Navigator.of(context).pop();
    }
  }
}
