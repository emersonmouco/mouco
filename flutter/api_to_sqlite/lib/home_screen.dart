import 'package:api_to_sqlite/provider/db_provider.dart';
import 'package:api_to_sqlite/provider/empregado_api_provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLoading = false;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("API to SQLite"),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.settings_input_antenna),
              onPressed: () async {
                await _loadFromApi();
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              right: 10,
            ),
            child: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await _deleteData();
              },
            ),
          ),
        ],
      ),
      body: isLoading ? Center(
        child: CircularProgressIndicator(),
      ) : _buildEmpregadoListView(),
    );
  }

  _loadFromApi() async {
    setState(() {
      isLoading = true;
    });

    var apiProvider = EmpregadoApiProvider();
    await apiProvider.obterTodosEmpregados();

    //esperar 2 segundos para simular o carregamento dos dados
    await Future.delayed(const Duration(seconds: 2));


    setState(() {
      isLoading = false;
    });
  }

  _deleteData() async {
    setState(() {
      isLoading = true;
    });
  
   await DBProvider.db.deleteTodosEmpregados();

   //esperar 1 segundo para simular o carregamento dos dados
   await Future.delayed(const Duration(seconds: 1));

   setState(() {
     isLoading = false;
   });

    print("Todos os empregados foram deletados");
  }

  _buildEmpregadoListView() {
    return FutureBuilder(
      future: DBProvider.db.obterTodosEmpregados(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.black12,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text(
                  "${index + 1}",
                  style: TextStyle(fontSize: 20.0),
                ),
                title: Text(
                    "Name: ${snapshot.data[index].firstName} ${snapshot.data[index].lastName} "),
                subtitle: Text('EMAIL: ${snapshot.data[index].email}'),
              );
            },
          );
        }
      },
    );
  }
}