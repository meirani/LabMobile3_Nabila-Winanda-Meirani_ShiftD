import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_modul3/side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var namauser;
  List<bool> _isChecked =
      List.generate(30, (index) => false); // menyimpan status checkbox

  @override
  void initState() {
    super.initState();
    _getUsername();
    _loadCheckBoxState(); // reload status checkbox apakah sudah di centang atau blm
  }

  // Function untuk mendapatkan username dari SharedPreferences
  void _getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      namauser = prefs.getString('username');
    });
  }

  // function untuk memuat status checkbox dari SharedPreferences
  void _loadCheckBoxState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedCheckedState = prefs.getStringList('checkboxState');
    if (savedCheckedState != null) {
      setState(() {
        _isChecked = savedCheckedState.map((e) => e == 'true').toList();
      });
    }
  }

  // Function untuk menyimpan status checkbox ke SharedPreferences
  void _saveCheckBoxState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stringCheckedState =
        _isChecked.map((e) => e.toString()).toList();
    await prefs.setStringList('checkboxState', stringCheckedState);
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> workoutDays = [
      {'day': 'Day 1', 'time': '30 minutes'},
      {'day': 'Day 2', 'time': '45 minutes'},
      {'day': 'Day 3', 'time': '30 minutes'},
      {'day': 'Day 4', 'time': '40 minutes'},
      {'day': 'Day 5', 'time': 'Rest'},
      {'day': 'Day 6', 'time': '20 minutes'},
      {'day': 'Day 7', 'time': '50 minutes'},
      {'day': 'Day 8', 'time': 'Rest'},
      {'day': 'Day 9', 'time': '35 minutes'},
      {'day': 'Day 10', 'time': '30 minutes'},
      {'day': 'Day 11', 'time': '30 minutes'},
      {'day': 'Day 12', 'time': '30 minutes'},
      {'day': 'Day 13', 'time': 'Rest'},
      {'day': 'Day 14', 'time': '45 minutes'},
      {'day': 'Day 15', 'time': '25 minutes'},
      {'day': 'Day 16', 'time': '40 minutes'},
      {'day': 'Day 17', 'time': '50 minutes'},
      {'day': 'Day 18', 'time': '40 minutes'},
      {'day': 'Day 19', 'time': 'Rest'},
      {'day': 'Day 20', 'time': '50 minutes'},
      {'day': 'Day 21', 'time': '30 minutes'},
      {'day': 'Day 22', 'time': 'Rest'},
      {'day': 'Day 23', 'time': '25 minutes'},
      {'day': 'Day 24', 'time': '50 minutes'},
      {'day': 'Day 25', 'time': '45 minutes'},
      {'day': 'Day 26', 'time': 'Rest'},
      {'day': 'Day 27', 'time': '40 minutes'},
      {'day': 'Day 28', 'time': '50 minutes'},
      {'day': 'Day 29', 'time': '50 minutes'},
      {'day': 'Day 30', 'time': '60 minutes'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MY Workout Schedule',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 43, 43, 43),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.lightGreen[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: workoutDays.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    color: Colors.white,
                    elevation: 3,
                    child: ListTile(
                      title: Text(
                        '${workoutDays[index]['day']}: ${workoutDays[index]['time']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      trailing: Checkbox(
                        value: _isChecked[index],
                        activeColor: Colors.green,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked[index] = value!;
                            _saveCheckBoxState();
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      drawer: const SideMenu(),
    );
  }
}
