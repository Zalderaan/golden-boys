import 'package:flutter/material.dart';

class PatientRecords extends StatefulWidget {
  final VoidCallback onAddPatient; // Add this parameter

  const PatientRecords({super.key, required this.onAddPatient});

   @override
  State<PatientRecords> createState() => _PatientRecordsState();
}

class _PatientRecordsState extends State<PatientRecords> {
  bool isExpanded = false;
  final List<bool> _filterSelections = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            // Dashboard content goes here
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2), // Shadow color
                                    spreadRadius: 2, // Spread radius
                                    blurRadius: 5, // Blur radius
                                    offset: const Offset(0, 3), // Changes the position of the shadow (x, y)
                                  ),
                                ],
                              ),
                              
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                              children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Patient Records",
                                        style: TextStyle(
                                          fontSize:32.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 66, 43, 21),
                                        ),
                                      ),
                                        Container(
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              colors: [Color(0xFFE2AD5E), Color(0xFF422B15)],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            borderRadius: BorderRadius.circular(8), // Match button shape
                                          ),
                                          child: ElevatedButton.icon(
                                          //ADD Patient
                                          onPressed: widget.onAddPatient,
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            ), 
                                          label: const Text(
                                            "Add Patient", 
                                            style: TextStyle(
                                              color: Colors.white
                                              ),
                                            ), 
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            shadowColor: Colors.transparent, // Remove shadow to avoid conflicts with gradient
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8), // Match container border radius
                                            ), // Background color of the button
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20.0), // Adds spacing between the title and the row of cards
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      buildInfoCard(
                                        "NUMBER OF PATIENTS",
                                        [
                                          "Returnee: ", "14",
                                          "New: ", "10",
                                          "Total: ", "24"
                                        ],
                                        Icons.people,
                                        color: Colors.white
                                      ),
                                      buildInfoCard(
                                        "LAST PATIENT DONE",
                                        [
                                          "Patient Name: ", "Gofrey Eclarinal",
                                          "Procedure Done: ", "Keme",
                                          "Dentist: ", "Dr. John Eric Dedicatoria"
                                        ],
                                        Icons.person,
                                        color: Colors.white
                                      ),
                                      buildInfoCard(
                                        "LATEST NEW PATIENT",
                                        [
                                          "Patient Name: ", "Jane Doe",
                                          "Procedure Done: ", "Consultation",
                                          "Dentist: ", "Dr. John Eric Dedicatoria"
                                        ],
                                        Icons.person,
                                        color: Colors.white
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            buildSearchAndFilterSection(),
                            const SizedBox(height: 30.0),
                            buildArticleList(),
                            const SizedBox(height: 20.0),
                            buildPagination(),
                          ],
                        ),
                      ),
                    ),
      ),
    );
  }



  Widget buildInfoCard(String title, List<String> details, IconData icon, {Color color = Colors.white}) {
  return Flexible(
    child: Card(
      color: const Color.fromARGB(255, 66, 43, 21),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Icon(icon, size: 100.0, color: color),
              ],
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: color),
                  ),
                  const SizedBox(height: 10.0),
                  // Insert details based on the provided details list
                  for (int i = 0; i < details.length; i += 2)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(details[i], style: TextStyle(fontSize: 16, color: color)),
                        Text(details[i + 1], style: TextStyle(fontSize: 16, color: color)),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

  Widget buildSearchAndFilterSection() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // Filter section
      Row(
        children: [
          // Switch-like filter options
          ToggleButtons(
            //borderWidth: 20.0,
            isSelected: _filterSelections,
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < _filterSelections.length; i++) {
                  _filterSelections[i] = i == index;
                }
              });
            },
            borderRadius: BorderRadius.circular(20.0),
            selectedColor: Colors.white,
            fillColor: Colors.brown[300],
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("All"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("Scheduled"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("New"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("Old"),
              ),
            ],
          ),
        ],
      ),

      // Search bar
      SizedBox(
        width: 300.0,
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search Patient Records",
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black26),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    ],
  );
}

  Widget buildArticleList() {
    return Column(
      children: [
        buildRecordItem("Vinsmoke Sanji", "New", "Scheduled"),
        buildRecordItem("Godfrey D. Eclarinal", "Old", "Scheduled"),
        buildRecordItem("John Eric D. Dedicatoria", "Old", "Scheduled"),
        buildRecordItem("Neil Carlo F. Nabor", "New", "Scheduled"),
      ],
    );
  }

  Widget buildRecordItem(String name, String status, String schedule) {
  return Card(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.brown[900],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              status,
              style: const TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Controlled width container
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
              decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                schedule,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget buildPagination() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(onPressed: () {}, child: Text("1", style: TextStyle(color: Colors.brown[900]))),
        TextButton(onPressed: () {}, child: Text("2", style: TextStyle(color: Colors.brown[900]))),
        TextButton(onPressed: () {}, child: Text("3", style: TextStyle(color: Colors.brown[900]))),
        TextButton(onPressed: () {}, child: Text("See All", style: TextStyle(color: Colors.brown[900]))),
      ],
    );
  }
}



