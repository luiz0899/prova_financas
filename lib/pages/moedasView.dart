import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:recuperacaoprovafinancas/Components/botao.dart';
import 'package:recuperacaoprovafinancas/Components/box.dart';
import 'package:recuperacaoprovafinancas/Models/acoes.dart';
import 'package:recuperacaoprovafinancas/Models/bitCoin.dart';
import 'package:recuperacaoprovafinancas/Models/financas.dart';
import 'package:recuperacaoprovafinancas/Models/item.dart';
import 'package:recuperacaoprovafinancas/Models/moeda.dart';

class MoedasView extends StatefulWidget {
  const MoedasView({super.key});

  @override
  State<MoedasView> createState() => _MoedasViewState();
}

class _MoedasViewState extends State<MoedasView> {
  //moéda
  Item dollar = Item(nome: '-', valor: 0.0, variacao: 0.0);
  Item yen = Item(nome: '-', valor: 0.0, variacao: 0.0);
  Item euro = Item(nome: '-', valor: 0.0, variacao: 0.0);
  Item peso = Item(nome: '-', valor: 0.0, variacao: 0.0);

  Moeda moeda = Moeda();

  //ações
  Item ibovespa = Item(nome: '-', valor: 0.0, variacao: 0.0);
  Item nasdaq = Item(nome: '-', valor: 0.0, variacao: 0.0);
  Item cac = Item(nome: '-', valor:0.0, variacao: 0.0);
  Item ifix = Item(nome: '-', valor: 0.0, variacao: 0.0);
  Item dowJones = Item(nome: '-', valor: 0.0, variacao: 0.0);
  Item nikkei = Item(nome: '-', valor: 0.0, variacao: 0.0);

  Acoes acoes = Acoes();

  //bitCoin
  Item blockchain = Item(nome: '-', valor:  0.0, variacao:  0.0);
  Item coinBase = Item(nome: '-', valor:  0.0, variacao:  0.0);
  Item bitStamp = Item(nome: '-', valor:  0.0, variacao:  0.0);
  Item foxBit = Item(nome: '-', valor:  0.0, variacao:  0.0);
  Item mercadoBit = Item(nome: '-', valor:  0.0, variacao:  0.0);

  Bitcoin bitcoin = Bitcoin();

  Financas? financas;

  @override
  void initState() {
    super.initState();
    buscarEndereco();
  }

  buscarEndereco() async {
    final String urlViaCep =
        'https://api.hgbrasil.com/finance?key=dacba3a8&format=json-cors';
    Response respFinance = await get(Uri.parse(urlViaCep));
    Map valFinance = json.decode(respFinance.body);

    setState(() {
      //moédas
      dollar = Item(
          nome: "Dólar",
          valor: valFinance['results']['currencies']['USD']['buy'],
          variacao: valFinance['results']['currencies']['USD']['variation']);
      euro = Item(
          nome: "Euro",
          valor: valFinance['results']['currencies']['EUR']['buy'],
          variacao: valFinance['results']['currencies']['EUR']['variation']);
      yen = Item(
          nome: "Yen",
          valor: valFinance['results']['currencies']['JPY']['buy'],
          variacao: valFinance['results']['currencies']['JPY']['variation']);
      peso = Item(
          nome: "Peso",
          valor: valFinance['results']['currencies']['ARS']['buy'],
          variacao: valFinance['results']['currencies']['ARS']['variation']);

      moeda = Moeda(dollar: dollar, euro: euro, peso: peso, yen: yen);

      //ações
      ibovespa = Item(
          nome: "IBOVESPA",
          valor: valFinance['results']['stocks']['IBOVESPA']['points'],
          variacao: valFinance['results']['stocks']['IBOVESPA']['variation']);
      nasdaq = Item(
          nome: "NASDAQ",
          valor: valFinance['results']['stocks']['NASDAQ']['points'],
          variacao: valFinance['results']['stocks']['NASDAQ']['variation']);
      cac = Item(
          nome: "CAC",
          valor: valFinance['results']['stocks']['CAC']['points'],
          variacao: valFinance['results']['stocks']['CAC']['variation']);
      ifix = Item(
          nome: "IFIX",
          valor: valFinance['results']['stocks']['IFIX']['points'],
          variacao: valFinance['results']['stocks']['IFIX']['variation']);
      dowJones = Item(
          nome: "DOWJONES",
          valor: valFinance['results']['stocks']['DOWJONES']['points'],
          variacao: valFinance['results']['stocks']['DOWJONES']['variation']);
      nikkei = Item(
          nome: "NIKKEI",
          valor: valFinance['results']['stocks']['NIKKEI']['points'],
          variacao: valFinance['results']['stocks']['NIKKEI']['variation']);

      acoes = Acoes(
          cac: cac,
          dowJones: dowJones,
          ibovespa: ibovespa,
          ifix: ifix,
          nasdaq: nasdaq,
          nikkei: nikkei);

      //BitCoin
      blockchain = Item(
          nome: "Blockchain.info",
          valor: valFinance['results']['bitcoin']['blockchain_info']['buy'],
          variacao: valFinance['results']['bitcoin']['blockchain_info']
              ['variation']);
      coinBase = Item(
          nome: "CoinBase",
          valor: valFinance['results']['bitcoin']['coinbase']['last'],
          variacao: valFinance['results']['bitcoin']['coinbase']['variation']);
      bitStamp = Item(
          nome: "BitStamp",
          valor: valFinance['results']['bitcoin']['bitstamp']['buy'],
          variacao: valFinance['results']['bitcoin']['bitstamp']['variation']);
      foxBit = Item(
          nome: "FoxBit",
          valor: valFinance['results']['bitcoin']['foxbit']['last'],
          variacao: valFinance['results']['bitcoin']['foxbit']['variation']);
      mercadoBit = Item(
          nome: "Mercado Bit",
          valor: valFinance['results']['bitcoin']['mercadobitcoin']['buy'],
          variacao: valFinance['results']['bitcoin']['mercadobitcoin']
              ['variation']);

      bitcoin = Bitcoin(
          Blockchain: blockchain,
          bitStamp: bitStamp,
          coinBase: coinBase,
          foxBit: foxBit,
          mercadoBit: mercadoBit);

      financas = Financas(bitcoin, acoes, moeda);
    });
  }

  telaAcoes() {
    Navigator.pushNamed(
      context,
      '/acoes',
      arguments: financas,
    );
  }

  @override
  Widget build(BuildContext context) {
    _criaBody() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(padding: EdgeInsets.all(40)),
          Center(child: Text("MOEDAS", style: TextStyle(fontSize: 30))),
          Padding(padding: EdgeInsets.all(30)),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border:
                    Border.all(color: Color.fromARGB(255, 0, 85, 17), width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(children: [
                Row(
                  children: [
                    Expanded(
                      child: Box(
                        nome: dollar.nome,
                        preco: "${dollar.valor.toStringAsFixed(4)}",
                        variacao: "${dollar.variacao.toStringAsFixed(4)}",
                      ),
                    ),
                    Expanded(
                      child: Box(
                        nome: euro.nome,
                        preco: "${euro.valor.toStringAsFixed(4)}",
                        variacao: "${euro.variacao.toStringAsFixed(4)}",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Box(
                        nome: peso.nome,
                        preco: "${peso.valor.toStringAsFixed(4)}",
                        variacao: "${peso.variacao.toStringAsFixed(4)}",
                      ),
                    ),
                    Expanded(
                      child: Box(
                        nome: yen.nome,
                        preco: "${yen.valor.toStringAsFixed(4)}",
                        variacao: "${yen.variacao.toStringAsFixed(4)}",
                      ),
                    ),
                  ],
                )
              ]),
            ),
          ),
          Botao(
            funcao: telaAcoes,
            texto: "Ir para Ações ",
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
