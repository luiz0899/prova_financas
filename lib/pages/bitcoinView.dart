import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:recuperacaoprovafinancas/Components/botao.dart';
import 'package:recuperacaoprovafinancas/Components/box.dart';
import 'package:recuperacaoprovafinancas/Models/bitCoin.dart';
import 'package:recuperacaoprovafinancas/Models/financas.dart';
import 'package:recuperacaoprovafinancas/Models/item.dart';

class BitcoinView extends StatefulWidget {
  const BitcoinView({super.key});

  @override
  State<BitcoinView> createState() => _BitcoinViewState();
}

class _BitcoinViewState extends State<BitcoinView> {
  @override
  Widget build(BuildContext context) {
    final finacas = ModalRoute.of(context)!.settings.arguments as Financas?;

    telaAcoes() {
      Navigator.pushNamed(
        context,
        '/moeda',
        arguments: finacas,
      );
    }

    _criaBody() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(padding: EdgeInsets.all(40)),
          Center(child: Text("BitCoin", style: TextStyle(fontSize: 30))),
          Padding(padding: EdgeInsets.all(30)),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 0, 141, 37), width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(children: [
                Row(
                  children: [
                    Expanded(
                      child: Box(
                        nome: finacas!.bitcoin!.Blockchain!.nome,
                        preco: "${finacas!.bitcoin!.Blockchain!.valor.toStringAsFixed(2)}",
                        variacao: "${finacas!.bitcoin!.Blockchain!.variacao.toStringAsFixed(3)}",
                      ),
                    ),
                    Expanded(
                      child: Box(
                          nome: finacas!.bitcoin!.coinBase!.nome,
                          preco: "${finacas!.bitcoin!.coinBase!.valor.toStringAsFixed(2)}",
                          variacao: "${finacas!.bitcoin!.coinBase!.variacao.toStringAsFixed(3)}"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Box(
                          nome: finacas!.bitcoin!.bitStamp!.nome,
                          preco: "${finacas!.bitcoin!.bitStamp!.valor.toStringAsFixed(2)}",
                          variacao: "${finacas!.bitcoin!.bitStamp!.variacao.toStringAsFixed(3)}"),
                    ),
                    Expanded(
                      child: Box(
                          nome: finacas!.bitcoin!.foxBit!.nome,
                          preco: "${finacas!.bitcoin!.foxBit!.valor.toStringAsFixed(2)}",
                          variacao: "${finacas!.bitcoin!.foxBit!.variacao.toStringAsFixed(3)}"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Box(
                          nome: finacas!.bitcoin!.mercadoBit!.nome,
                          preco: "${finacas!.bitcoin!.mercadoBit!.valor.toStringAsFixed(2)}",
                          variacao: "${finacas!.bitcoin!.mercadoBit!.variacao.toStringAsFixed(3)}"),
                    ),
                  ],
                )
              ]),
            ),
          ),
          Botao(
            funcao: telaAcoes,
            texto: "Ir para Moedas ",
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Finanças de Hoje'),
        backgroundColor: Color.fromARGB(255, 0, 85, 17),
      ),
      body: _criaBody(),
    );
  }
}
