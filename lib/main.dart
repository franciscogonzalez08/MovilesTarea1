import 'package:flutter/material.dart';
 
void main() => runApp(MyAppITESO());

 
class MyAppITESO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int likeCounter = 0;
  Color mailColor = Colors.black;
  Color callColor = Colors.black;
  Color directionsColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App ITESO'),
      ),
      body: Column(
        children: [
          // Imagen
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Image.network(
              'https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg'
            ),
          ),
          // Fila con textos y boton
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 7,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'El ITESO, Universidad Jesuita de Guadalajara',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          'San Pedro Tlaquepaque, Jal.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: IconButton(
                      // Siguientes 2 lineas nos ayudan a quitarle el padding a los botones. No es que se tenga padding sino que asumen un tamanio minimo de 48 px
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: (){
                        print('like'); // DBUG
                        setState(() {
                          likeCounter++;
                        });
                      },
                      icon: Icon(
                        Icons.thumb_up,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: (){
                        print('dislike'); // DBUG
                        setState(() {
                          likeCounter--;
                        });
                      },
                      icon: Icon(
                        Icons.thumb_down,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        '$likeCounter',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
          // Row
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: (){
                        setState(() {
                          if(mailColor == Colors.black) {
                            mailColor = Colors.indigo;
                          } else {
                            mailColor = Colors.black;
                          }
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('Enviar correo'),
                          duration: Duration(seconds: 1),
                          )
                        );
                      }, 
                      icon: Icon(
                        Icons.mail,
                        size: 40,
                        color: mailColor,
                      ),
                    ),
                    Text(
                      'Correo',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: (){
                        setState(() {
                          if(callColor == Colors.black) {
                            callColor = Colors.indigo;
                          } else {
                            callColor = Colors.black;
                          }
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('Hacer llamada'),
                          duration: Duration(seconds: 1),
                          )
                        );
                      }, 
                      icon: Icon(
                        Icons.call,
                        size: 40,
                        color: callColor,
                      ),
                    ),
                    Text(
                      'Llamada',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: (){
                        setState(() {
                          if(directionsColor == Colors.black) {
                            directionsColor = Colors.indigo;
                          } else {
                            directionsColor = Colors.black;
                          }
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('Ir al ITESO'),
                          duration: Duration(seconds: 1),                          
                          )
                        );
                      }, 
                      icon: Icon(
                        Icons.directions,
                        size: 40,
                        color: directionsColor,
                      ),
                    ),
                    Text(
                      'Ruta',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Text
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'El ITESO, Universidad Jesuita de Guadalajara, es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita que integra a ocho universidades en México. Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas.',
                style: TextStyle(
                  fontSize: 10,
                ),
                textAlign: TextAlign.justify,
              ),
            )
          ),
        ],
      ),
    );
  }
}