// lib/forms/personal_info_form.dart
import 'package:flutter/material.dart';


class AllergiesForms extends StatefulWidget {
  final bool isAllergicToAnesthetic;
  final bool isAllergicToAntibiotics;
  final bool isAllergicToSulfa;
  final bool isAllergicToAspirin;
  final bool isAllergicToLatex;
  final bool isAllergicToOthers;
  final TextEditingController allergiesOthersController;
  final Function(bool, bool, bool, bool, bool) onAllergiesChanged;

  const AllergiesForms({
    super.key, 
    required GlobalKey<FormState> formKey,
    required this.isAllergicToAnesthetic,
    required this.isAllergicToAntibiotics,
    required this.isAllergicToSulfa,
    required this.isAllergicToAspirin,
    required this.isAllergicToLatex,
    required this.allergiesOthersController,
    required this.isAllergicToOthers,
    required this.onAllergiesChanged,
  });

  @override
  AllergiesFormsState createState() => AllergiesFormsState();
}

class AllergiesFormsState extends State<AllergiesForms> {
  final _allergicFormKey = GlobalKey<FormState>();


  late bool _isAllergicToAnesthetic;
  late bool _isAllergicToPenicillin;
  late bool _isAllergicToSulfa;
  late bool _isAllergicToAspirin;
  late bool _isAllergicToLatex;
  late bool _isAllergicToOthers;

  @override
  void initState(){
    super.initState();
    _isAllergicToAnesthetic = widget.isAllergicToAnesthetic;
    _isAllergicToPenicillin = widget.isAllergicToAntibiotics;
    _isAllergicToSulfa = widget.isAllergicToSulfa;
    _isAllergicToAspirin = widget.isAllergicToAspirin;
    _isAllergicToLatex = widget.isAllergicToLatex;
    _isAllergicToOthers = widget.isAllergicToOthers;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _allergicFormKey,
        child: Column(
          children: [
            // (ALlergies fields)
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Allergies",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      height: 10,
                      color: Colors.grey[400],
                      thickness: 0.5,
                    ),
                    const SizedBox(height: 10),
                    // Allergies Question
                    
                    const Row(
                      children: [
                        Text(
                          "Are you allergic to any of the following:",
                          style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 50),
                            Checkbox(
                              value: _isAllergicToAnesthetic,
                              onChanged: (value) {
                                setState(() {
                                  _isAllergicToAnesthetic = value!;
                                });
                                widget.onAllergiesChanged(_isAllergicToAnesthetic, _isAllergicToPenicillin, _isAllergicToSulfa, _isAllergicToAspirin, _isAllergicToLatex);
                              },
                            ),
                            const Text("Local Anesthetic (ex. Lidocaine)"),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 50),
                            Checkbox(
                              value: _isAllergicToPenicillin,
                              onChanged: (value) {
                                setState(() {
                                  _isAllergicToPenicillin = value!;
                                });
                                widget.onAllergiesChanged(_isAllergicToAnesthetic, _isAllergicToPenicillin, _isAllergicToSulfa, _isAllergicToAspirin, _isAllergicToLatex);
                              },
                            ),
                            const Text("Penicillin, Antibiotics"),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 50),
                            Checkbox(
                              value: _isAllergicToSulfa,
                              onChanged: (value) {
                                setState(() {
                                  _isAllergicToSulfa = value!;
                                });
                                widget.onAllergiesChanged(_isAllergicToAnesthetic, _isAllergicToPenicillin, _isAllergicToSulfa, _isAllergicToAspirin, _isAllergicToLatex);
                              },
                            ),
                            const Text("Sulfa drugs"),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 50),
                            Checkbox(
                              value: _isAllergicToAspirin,
                              onChanged: (value) {
                                setState(() {
                                  _isAllergicToAspirin = value!;
                                });
                                widget.onAllergiesChanged(_isAllergicToAnesthetic, _isAllergicToPenicillin, _isAllergicToSulfa, _isAllergicToAspirin, _isAllergicToLatex);
                              },
                            ),
                            const Text("Aspirin"),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 50),
                            Checkbox(
                              value: _isAllergicToLatex,
                              onChanged: (value) {
                                setState(() {
                                  _isAllergicToLatex = value!;
                                });
                                widget.onAllergiesChanged(_isAllergicToAnesthetic, _isAllergicToPenicillin, _isAllergicToSulfa, _isAllergicToAspirin, _isAllergicToLatex);
                              },
                            ),
                            const Text("Latex"),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              value: _isAllergicToOthers,
                              onChanged: (value) {
                                setState(() {
                                  _isAllergicToOthers = value!;
                                });
                              },
                            ),
                            const Text("Others: "),
                            const SizedBox(width: 5),
                            // Text field for specifying other allergies
                            SizedBox(
                              width: 150, // Adjust width as needed
                              child: TextFormField(
                                controller: widget.allergiesOthersController,
                                enabled: _isAllergicToOthers,
                                decoration: const InputDecoration(
                                  hintText: "Specify other allergies",
                                  border: UnderlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
          
        ],
      ),
    );                  
  }
}
