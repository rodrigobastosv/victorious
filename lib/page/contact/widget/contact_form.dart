import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  String _nome;
  String _email;
  String _mensagem;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deixe sua mensagem:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Seu nome',
                  isDense: true,
                ),
                validator: (nome) => nome.isEmpty ? 'Campo Obrigatório' : null,
                onSaved: (nome) => _nome = nome,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  isDense: true,
                ),
                validator: (email) =>
                    email.isEmpty ? 'Campo Obrigatório' : null,
                onSaved: (email) => _email = email,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 500,
              child: TextFormField(
                minLines: 5,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Mensagem',
                  isDense: true,
                ),
                validator: (msg) => msg.isEmpty ? 'Campo Obrigatório' : null,
                onSaved: (msg) => _mensagem = msg,
              ),
            ),
            SizedBox(height: 16),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              color: Theme.of(context).colorScheme.primaryVariant,
              child: Text('Enviar'),
              onPressed: () async {
                final form = _formKey.currentState;
                if (form.validate()) {
                  form.save();
                  await FirebaseFirestore.instance.collection('emails').add(
                    {
                      'to': 'victoriousfcmma@gmail.com',
                      'message': {
                        'subject': '$_nome - $_email',
                        'text': _mensagem,
                        'html': _mensagem,
                      }
                    },
                  );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      padding: EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black.withOpacity(.2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '''Mensagem enviada!''',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            '''Responderemos o mais breve possível.''',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    width: 300,
                    elevation: 0,
                    duration: Duration(seconds: 10),
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height - 200,
                    ),
                    shape: RoundedRectangleBorder(),
                  ),
                );
                  form.reset();
                }
              },
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
