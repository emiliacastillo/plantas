import 'package:flutter/material.dart';

class PlantList extends StatefulWidget {
  @override
  _PlantListState createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  ScrollController _scrollController;
  List allDescription = [
    'Emilia Es la mejor del mundo i\'ts',
    'Otra cosa la puedo escribir aqui',
    'Y otra mas',
  ];
  String description;

  @override
  void initState() {
     super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(changedesc);
    setState(() {
      description = allDescription[0];
    });
  }

  changedesc() {
    var value = _scrollController.offset.round();
    var descIndex = (value / 150).round();
    print(value);
    setState(() {
      description = allDescription[descIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //aqui creo los espacios para los card de los producto
        Container(
          height: 350.0,
          child: ListView(
            padding: EdgeInsets.only(left: 25.0),
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              ///aqui creo el contenido del card individual y le doy un espaciado
              getPlantCard('assets/hoja.jpg', '25', 'OUTDOOR', ' Aloe Vera'),
              SizedBox(width: 15.0),
              ///aqui creo el contenido del card individual y le doy un espaciado
              getPlantCard('assets/weaver.jpg', '25', ' INDOOR', ' Ficus'),
              SizedBox(width: 15.0),
              ///aqui creo el contenido del card individual y le doy un espaciado
              getPlantCard('assets/euqNc.png', '25', ' INDOOR', 'Ficus'),
              SizedBox(width: 15.0),
            ],
          ),
        ),
       ////aqui creo el espacio para el titulo descripcion 
        Padding(
          padding: EdgeInsets.only(left: 25.0, top: 10.0),
          child: Text(
            'Description',
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.w500),
          ),
        ),
        ///aqui pongo el contenido de la descripcion
        Padding(
          padding: EdgeInsets.only(left: 25.0, top: 10.0),
          child: Text(
            description,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12.0,
            ),
          ),
        )
      ],
    );
  }
////la funcion que me da el contenido del card por producto
  getPlantCard(
      String imgPath, String price, String plantType, String plantName) {
    return Stack(
      children: <Widget>[
        //aqui empiezo con el widget del producto
        Container(
          height: 325.0,
          width: 225.0,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFF399D63)
            ),
            height: 250.0,
            width: 225.0,
            child: Column(
              children: <Widget>[
                //señalo la fila de arriba para el precio
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    //aqui pongo la inf del precio del producto
                    Column(
                      children: <Widget>[
                        SizedBox(height: 10.0),
                        Text(
                          'FROM',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF8AC7A4)),
                        ),
                        Text(
                          '\$' + price,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(width: 10.0)
                  ],
                ),
                //aqui pongo la imagen del producto
                  Image(image: AssetImage(imgPath),
                  height: 165.0,
                ),
               //declaro la fila del tipo de planta y el titulo
                Row(
                  children: <Widget>[
                    //aqui pongo el tipo de planta y el titulo
                    Column(
                      children: <Widget>[
                        SizedBox(height: 10.0),
                        Text(
                          plantType,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF8AC7A4)),
                        ),
                        Text(
                          plantName,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    ///aqui declaro el un boton
                    SizedBox(width: 25.0),
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xFF8AC7A4),
                            style: BorderStyle.solid,
                            width: 0.5),
                        borderRadius: BorderRadius.circular(5.0),
                        color: Color(0xFF399D63),
                      ),
                      child: Icon(
                        Icons.wb_sunny,
                        color: Colors.white.withOpacity(0.4),
                        size: 20.0,
                      ),
                    ),
                   ///aqui declaro el un boton
                    SizedBox(width: 15.0),
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xFF8AC7A4),
                            style: BorderStyle.solid,
                            width: 0.5),
                        borderRadius: BorderRadius.circular(5.0),
                        color: Color(0xFF399D63),
                      ),
                      child: Icon(
                        Icons.hot_tub,
                        color: Colors.white.withOpacity(0.4),
                        size: 20.0,
                      ),
                    ),
                    ///aqui declaro el un boton para la  ayuda ?                   
                    SizedBox(width: 10.0),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(color: Color(0xFF399D63)),
                        child: Icon(Icons.help_outline,
                            color: Colors.white.withOpacity(0.4), size: 20.0),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
       ///aqui pongo el boton del carrito
        Padding(
          padding: EdgeInsets.only(left: 90.0, top: 300.0),
          child: Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0), color: Colors.black),
            child: Center(
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
