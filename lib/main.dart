import 'package:flutter/material.dart';
import 'package:jogo_da_forca/pagina_dois.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Jogo',
              style: TextStyle(
                shadows: <Shadow> [
                  Shadow(
                    offset: Offset(10.0, 10.0),
                    blurRadius: 32.0,
                    color: Color.fromARGB(255, 73, 73, 73)
                  )
                ],
                fontFamily: 'Nabla',
                fontSize: 54),
            ),
            const Text(
              'da',
              style: TextStyle(
                shadows: <Shadow> [
                  Shadow(
                    offset: Offset(10.0, 10.0),
                    blurRadius: 35.0,
                    color: Color.fromARGB(255, 73, 73, 73)
                  )
                ],
                fontFamily: 'Nabla',
                fontSize: 54),
            ),
            const Text(
              'Forca',
              style: TextStyle(
                shadows: <Shadow> [
                  Shadow(
                    offset: Offset(10.0, 10.0),
                    blurRadius: 32.0,
                    color: Color.fromARGB(255, 73, 73, 73)
                  )
                ],
                fontFamily: 'Nabla',
                fontSize: 54),
            ),
            const SizedBox(height: 80,),
            OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (BuildContext context) => Game()));
              },
              style: OutlinedButton.styleFrom(
                disabledBackgroundColor: Colors.transparent,
                side: const BorderSide(color: Colors.black, width: 3)
              ),
              child: const Text("Iniciar Jogo", style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),),
              ),
          ],
        ),
      ),
    );
  }
}
