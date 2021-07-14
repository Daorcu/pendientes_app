import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pendientes_app/providers/pendiente_provider.dart';

import 'package:pendientes_app/widgets/pendiente_widget.dart';

class PendientList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PendienteProvider>(context);
    final pendientes = provider.pendientes;

    return pendientes.isEmpty
        ? Center(
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sim_card_alert_outlined,
                    size: 200,
                    color: Colors.white38,
                  ),
                  Text(
                    'No tenemos pendientes',
                    style: TextStyle(fontSize: 30, color: Colors.white60),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Que bueno...',
                    style: TextStyle(fontSize: 10, color: Colors.white60),
                  ),
                ],
              ),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(15),
            separatorBuilder: (context, index) => SizedBox(height: 8),
            itemCount: pendientes.length,
            itemBuilder: (context, index) {
              final pendiente = pendientes[index];
              return PendienteWidget(pendiente: pendiente);
            },
          );
  }
}
