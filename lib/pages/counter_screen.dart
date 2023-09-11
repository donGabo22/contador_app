import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$contador',
              style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w200,
                  color: Colors.indigo),
            ),
            Text(
              'Clik${contador == 1 ? '' : 's'}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        CustomButton(
          onPressed: () {
            setState(() {
              contador++;
            });
          },
          icono: Icons.plus_one_outlined,
        ),
        CustomButton(
          onPressed: () {
            setState(() {
              contador--;
 
              if(contador < 0) {
                contador = 0;
              }
            });
          },
          icono: Icons.exposure_minus_1,
        ),
        CustomButton(
          onPressed: () {
            setState(() {
              contador = 0;
            });
          },
          icono: Icons.refresh_outlined,
        ),
      ]),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icono;
  final VoidCallback? onPressed;
  const CustomButton({super.key, required this.icono, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Icon(icono),
    );
  }
}