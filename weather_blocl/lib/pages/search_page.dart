import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  void _submit(){
    setState(() {
      autovalidateMode=AutovalidateMode.always;
    });
    final form=_formKey.currentState;
    if (form !=null && form.validate()) {
      form.save();
      Navigator.pop(context,_city!.trim());
    }
  }
  final _formKey = GlobalKey<FormState>();
  String? _city;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SEarch'),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(
              height: 60.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                autofocus: true,
                style: TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                    labelText: 'City Name',
                    hintText: 'More than two characters',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder()),
                validator: (String? input) {
                  if (input == null || input.trim().length < 2) {
                    return "City name must at least more than two characters";
                  }
                  return null;
                },
                onSaved: (String? input) {
                  _city = input;
                },
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _submit,
              child: Text(
                'How\'s Weather',
                style: TextStyle(fontSize: 18.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
