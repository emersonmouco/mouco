import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoTeste = "Informe seus dados";

  void _resetFields(){
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      _infoTeste = "Informe seus dados";
    });
  }

  void calculate(){
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;

      double imc = peso / (altura * altura);
      if(imc < 18.6){
        _infoTeste = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 18.6 && imc < 24.9){
        _infoTeste = "Peso Ideal (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 24.9 && imc < 29.9){
        _infoTeste = "Levemente Acima do Peso (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 29.9 && imc < 34.9){
        _infoTeste = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 34.9 && imc < 39.9){
        _infoTeste = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      } else if(imc >= 40){
        _infoTeste = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculadora de IMC",
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.person_outline, size: 120, color: Colors.lightBlueAccent,),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Peso em Kg",
                    labelStyle: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 25,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25),
                  controller: pesoController,
                  validator: (value){
                    if(value.isEmpty){
                      return "Insira seu peso!";
                    }
                  },
                ),
                Padding(padding: EdgeInsets.only(bottom: 10),),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Altura em cm",
                    labelStyle: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 25,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25),
                  controller: alturaController,
                  validator: (value){
                    if(value.isEmpty){
                      return "Insira sua altura!";
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    height: 50,
                    child: RaisedButton(
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          calculate();
                        }
                      },
                      child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 25),),
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10, bottom: 10),),
                Text(
                  _infoTeste,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 25
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
