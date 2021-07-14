import 'package:flutter/material.dart';

class PendienteFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSaved;

  const PendienteFormWidget({
    Key? key,
    this.title = '',
    this.description = '',
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTile(),
          SizedBox(height: 8),
          buildDescription(),
          SizedBox(height: 8),
          buildButton(),
        ],
      ),
    );
  }

  Widget buildTile() => TextFormField(
        textCapitalization: TextCapitalization.sentences,
        initialValue: title,
        maxLines: 1,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title!.isEmpty) {
            return 'Vamos, dale un título a tu pendiente';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Título del pendiente',
        ),
      );

  Widget buildDescription() => TextFormField(
        textCapitalization: TextCapitalization.sentences,
        maxLines: 2,
        initialValue: description,
        onChanged: onChangedDescription,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Descripción',
        ),
      );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber)),
          child: Text(
            'Guardar',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: onSaved,
        ),
      );
}
