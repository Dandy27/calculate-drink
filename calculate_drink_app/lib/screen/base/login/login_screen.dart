import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'E-mail'
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (email){
                  return null;
                },
              ),const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Senha'
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                obscureText: true,
                validator: (pass){
                  if(pass.isEmpty || pass.length < 6)
                    return 'Senha inválida';
                  return null;
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: (){

                  },
                  padding: EdgeInsets.zero,
                  child: Text('Esqueci minha senha'),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 54 ,
                child: RaisedButton(
                    child: Text('Entrar', style: TextStyle(fontSize: 20),),
                    textColor: Colors.white,

                    onPressed: (){},
                color: Theme.of(context).primaryColor,),
              )

            ],
          ),
        ),
      ),
    );
  }
}
