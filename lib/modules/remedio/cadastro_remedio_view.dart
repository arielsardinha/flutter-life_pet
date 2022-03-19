import 'package:flutter/material.dart';
import 'package:life_pet/mixins/format_date.dart';
import 'package:life_pet/modules/remedio/cadastro_remedio_controller.dart';

class CadastroRemedioView extends StatefulWidget {
  const CadastroRemedioView({Key? key}) : super(key: key);

  @override
  State<CadastroRemedioView> createState() => _CadastroRemedioViewState();
}

class _CadastroRemedioViewState extends State<CadastroRemedioView>
    with FormatDateMixin {
  final _formKey = GlobalKey<FormState>();
  final controller = CadastroRemedioController();

  @override
  Widget build(BuildContext context) {
    final petId = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro remedio Pet'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.nomeController,
                  validator: (value) {
                    return controller.validateFormTextFiel(value);
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Nome do remedio',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                    labelStyle: TextStyle(color: Colors.redAccent),
                  ),
                ),
                TextFormField(
                  controller: controller.dataController,
                  onTap: () => _selectDatePicker(),
                  validator: (value) => controller.validateFormTextFiel(value),
                  keyboardType: TextInputType.none,
                  decoration: const InputDecoration(
                    labelText: 'Data do remedio',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                    labelStyle: TextStyle(color: Colors.redAccent),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 20),
                  child: OutlinedButton(
                    onPressed: () {
                      final isFormValid =
                          _formKey.currentState?.validate() ?? false;
                      if (isFormValid) {
                        controller.addNewRemedio(
                            petId: petId, context: context);
                      }
                    },
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDatePicker() async {
    final data = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019, 1),
      lastDate: DateTime(2030),
      builder: (ctx, child) {
        return Theme(
          data: Theme.of(ctx).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.redAccent,
              onSurface: Colors.redAccent,
            ),
          ),
          child: child!,
        );
      },
    );
    if (data != null) {
      setState(() {
        controller.dataController.text = convertDateToString(data);
        controller.dataSelecionada = data;
      });
    }
  }
}
