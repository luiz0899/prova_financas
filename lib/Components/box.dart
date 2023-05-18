import 'package:flutter/material.dart';
import 'package:recuperacaoprovafinancas/Models/financas.dart';

class Box extends StatefulWidget {
  dynamic nome;
  dynamic preco;
  dynamic variacao;

  Box({super.key, this.nome, this.preco, this.variacao});

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  @override
  Widget build(BuildContext context) {
    Color color;

    double variacaoValue = double.parse(widget.variacao);

    if (variacaoValue < 0) {
      color = Colors.red;
    } else {
      color = Colors.blue;
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: (Column(
        children: [
          Row(
            children: [
              Text(widget.nome,
                  style: TextStyle(
                      color: Color.fromARGB(255, 109, 109, 109),
                      fontWeight: FontWeight.bold,
                      fontSize: 18))
            ],
          ),
          Row(
            children: [
              Text(widget.preco, style: TextStyle(fontSize: 30)),
              Padding(padding: EdgeInsets.all(5)),
              SizedBox(
                width: 40,
                height: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      widget.variacao,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 10,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
