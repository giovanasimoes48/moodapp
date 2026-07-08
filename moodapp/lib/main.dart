import 'package:flutter/material.dart';

void main() {
  runApp(const MoodApp());
}

class MoodApp extends StatelessWidget {
  const MoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
Color cor = Colors.grey;
IconData icone = Icons.sentiment_neutral;
String texto = "Escolha um humor";
double tamanho = 150;
double borda = 20;
bool mostrarMensagem = false;
String mensagem = "";

void mudarHumor(String humor) {
  setState(() {
      mostrarMensagem = true;

      if (humor == "Feliz") {
        cor = Colors.yellow;
        icone = Icons.sentiment_very_satisfied;
        texto = "Hoje estou feliz!";
        tamanho = 180;
        borda = 50;
        mensagem = "Você escolheu o humor Feliz!";
      }

      if (humor == "Calmo") {
        cor = Colors.lightBlue;
        icone = Icons.cloud;
        texto = "Momento de tranquilidade.";
        tamanho = 160;
        borda = 10;
        mensagem = "Você escolheu o humor Calmo!";
      }

      if (humor == "Animado") {
        cor = Colors.orange;
        icone = Icons.bolt;
        texto = "Energia total!";
        tamanho = 200;
        borda = 30;
        mensagem = "Você escolheu o humor Animado!";
      }
  });
}

@override
Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
    title: const Text("Mood App"),
    backgroundColor: Colors.purple,
  ),
  body: Center(
  child: SingleChildScrollView(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [

  const Text(
  "Mood App",
  style: TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  ),
  ),

  const SizedBox(height: 10),

  const Text(
  "Escolha um humor e veja a tela mudar.",
  textAlign: TextAlign.center,
  ),

  const SizedBox(height: 30),

  AnimatedContainer(
  duration: const Duration(seconds: 1),
  width: tamanho,
  height: tamanho,
  decoration: BoxDecoration(
  color: cor,
  borderRadius: BorderRadius.circular(borda),
  ),
  child: Icon(
  icone,
  size: 70,
  color: Colors.white,
  ),
  ),

  const SizedBox(height: 20),

  Text(
  texto,
  style: const TextStyle(fontSize: 20),
  ),

  const SizedBox(height: 20),

  AnimatedOpacity(
  duration: const Duration(seconds: 1),
  opacity: mostrarMensagem ? 1.0 : 0.0,
  child: Text(
  mensagem,
  style: const TextStyle(fontSize: 18),
  ),
  ),

  const SizedBox(height: 30),

  ElevatedButton(
  onPressed: () {
  mudarHumor("Feliz");
  },
  child: const Text("Feliz"),
  ),

  ElevatedButton(
  onPressed: () {
  mudarHumor("Calmo");
  },
  child: const Text("Calmo"),
  ),

  ElevatedButton(
  onPressed: () {
  mudarHumor("Animado");
  },
  child: const Text("Animado"),
  ),
  ],
  ),
  ),
  ),
  );
}
}