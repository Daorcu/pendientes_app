import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:pendientes_app/models/pendiente.dart';
import 'package:pendientes_app/pages/edit_pendiente_page.dart';
import 'package:pendientes_app/providers/pendiente_provider.dart';
import 'package:pendientes_app/utils/utils.dart';

class PendienteWidget extends StatelessWidget {
  final Pendiente pendiente;

  const PendienteWidget({
    Key? key,
    required this.pendiente,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        key: Key(pendiente.id),
        actions: [
          IconSlideAction(
            color: Colors.blue,
            caption: 'Editar',
            icon: Icons.edit_outlined,
            onTap: () => editPendiente(context, pendiente),
          )
        ],
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            caption: 'Eliminar',
            icon: Icons.delete_outline,
            onTap: () => deletePendiente(context, pendiente),
          ),
        ],
        child: buildPendiente(context),
      ),
    );
  }

  Container buildPendiente(BuildContext context) => Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              value: pendiente.isDone,
              onChanged: (_) {
                final provider =
                    Provider.of<PendienteProvider>(context, listen: false);
                final isDone = provider.togglePendienteStatus(pendiente);

                Utils.showSnackBar(
                  context,
                  isDone
                      ? '¡Eso! Movido a completados'
                      : 'Ok, movido de nuevo a pendientes',
                );
              },
            ),
            SizedBox(width: 20),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pendiente.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                  ),
                ),
                if (pendiente.description.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      pendiente.description,
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.5,
                      ),
                    ),
                  )
              ],
            ))
          ],
        ),
      );

  void deletePendiente(BuildContext context, Pendiente pendiente) {
    final provider = Provider.of<PendienteProvider>(context, listen: false);
    provider.removePendiente(pendiente);

    Utils.showSnackBar(context, '¡Excelente, un pendiente menos!');
  }

  void editPendiente(BuildContext context, Pendiente pendiente) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
              EditPendientePage(pendiente: pendiente)));
}
