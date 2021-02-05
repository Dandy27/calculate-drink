import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() async {
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          hintColor: Colors.amber,
          primaryColor: Colors.black,
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
            hintStyle: TextStyle(color: Colors.amber),
          )),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController prodController = TextEditingController();
  TextEditingController quantController = TextEditingController();
  TextEditingController pesoBrutoController = TextEditingController();
  TextEditingController taraController = TextEditingController();
  TextEditingController pesoGrfAbertaController = TextEditingController();

  String _infoText = 'Result: (0 doses)';

  void _resetFields() {
    prodController.text = '';
    quantController.text = '';
    pesoBrutoController.text = '';
    taraController.text = '';
    pesoGrfAbertaController.text = '';
    setState(() {
      _infoText = 'Result: (0 doses)';
    });
  }

  void _calculate() {
    setState(() {
      double quantDoses = double.parse(quantController.text);
      double pesoBruto = double.parse(pesoBrutoController.text);
      double tara = double.parse(taraController.text);
      double pesoGrfAberta = double.parse(pesoGrfAbertaController.text);
      double total = ((pesoGrfAberta - tara) * quantDoses) / (pesoBruto - tara);
      print(total);
      if ((pesoGrfAberta >= tara) &&
          (pesoGrfAberta <= pesoBruto) &&
          (quantDoses >= 1)) {
        _infoText = 'Result: (${total.toStringAsFixed(1)}) doses';
      } else {
        _infoText = 'ERROR';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: IconButton(
                iconSize: 30,
                onPressed: null,
                icon: Icon(
                  Icons.list,
                  color: Colors.white,
                ),
              ),
              expandedHeight: 200.0,
              actions: [
                SizedBox(
                  width: 70,
                  height: 100,
                  child: IconButton(
                    iconSize: 30,
                    onPressed: _resetFields,
                    icon: Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    "Calculate Drink",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  background: Image.network(
                    "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: prodController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Produto",
                        labelStyle: TextStyle(color: Colors.white),
                        prefixText: 'nome:',
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green, fontSize: 22.00),
                    ),
                    Divider(),
                    TextFormField(
                      controller: quantController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Quant Doses",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixText: 'doses:'),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green, fontSize: 22.00),
                    ),
                    Divider(),
                    TextFormField(
                      controller: pesoBrutoController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Peso bruto",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixText: 'gramas:'),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green, fontSize: 22.00),
                    ),
                    Divider(),
                    TextFormField(
                      controller: taraController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Tara",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixText: 'gramas:'),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green, fontSize: 22.00),
                    ),
                    Divider(),
                    TextFormField(
                      controller: pesoGrfAbertaController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Peso grf aberta",
                          labelStyle: TextStyle(color: Colors.white),
                          prefixText: 'gramas:'),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green, fontSize: 22.00),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(
                          child: Text(
                            _infoText,
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 14),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.red)),
                          onPressed: _calculate,
                          color: Colors.amber,
                          textColor: Colors.black,
                          child: Text("Calcular".toUpperCase(),
                              style: TextStyle(fontSize: 20)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
