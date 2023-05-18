
import 'package:flutter/material.dart';

import 'package:recuperacaoprovafinancas/Components/botao.dart';
import 'package:recuperacaoprovafinancas/Components/box.dart';
import 'package:recuperacaoprovafinancas/Models/financas.dart';

class AcoesView extends StatefulWidget {
  const AcoesView({super.key});

  @override
  State<AcoesView> createState() => _AcoesViewState();
}

class _AcoesViewState extends State<AcoesView> {
  @override
  Widget build(BuildContext context) {
    final finacas = ModalRoute.of(context)!.settings.arguments as Financas?;

    telaAcoes() {
      Navigator.pushNamed(
        context,
        '/bitcoin',
        arguments: finacas,
      );
    }

    _criaBody() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(padding: EdgeInsets.all(40)),
          Center(child: Text("Ações", style: TextStyle(fontSize: 30))),
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
                        nome: finacas!.acoes!.ibovespa!.nome,
                        preco: "${finacas!.acoes!.ibovespa!.valor.toStringAsFixed(2)}",
                        variacao: "${finacas!.acoes!.ibovespa!.variacao.toStringAsFixed(2)}",
                      ),
                    ),
                    Expanded(
                      child: Box(
                        nome:finacas!.acoes!.ifix!.nome,
                        preco:"${finacas!.acoes!.ifix!.valor.toStringAsFixed(2)}",
                        variacao:"${finacas!.acoes!.ifix!.variacao.toStringAsFixed(2)}",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Box(
                        nome: finacas!.acoes!.nasdaq!.nome,
                        preco: "${finacas!.acoes!.nasdaq!.valor.toStringAsFixed(2)}",
                        variacao: "${finacas!.acoes!.nasdaq!.variacao.toStringAsFixed(2)}",
                      ),
                    ),
                    Expanded(
                      child: Box(
                        nome: finacas!.acoes!.dowJones!.nome,
                        preco: "${finacas!.acoes!.dowJones!.valor.toStringAsFixed(2)}",
                        variacao: "${finacas!.acoes!.dowJones!.variacao.toStringAsFixed(2)}",
                      ),
                    ),
                  ]), 
                    Row(
                      children: [
                        Expanded(
                          child: Box(
                            nome: finacas!.acoes!.cac!.nome,
                            preco: "${finacas!.acoes!.cac!.valor.toStringAsFixed(2)}",
                            variacao: "${finacas!.acoes!.cac!.variacao.toStringAsFixed(2)}",
                          ),
                        ),
                        Expanded(
                          child: Box(
                            nome: finacas!.acoes!.nikkei!.nome,
                            preco: "${finacas!.acoes!.nikkei!.valor.toStringAsFixed(2)}",
                            variacao: "${finacas!.acoes!.nikkei!.variacao.toStringAsFixed(2)}",
                          ),
                        ),
                      ],
                    )
                  ],
              ),
            ),
          ),
          Botao(
            funcao: telaAcoes,
            texto: "Ir para BitCoin ",
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
