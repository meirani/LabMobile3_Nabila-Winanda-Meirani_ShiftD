# tugas_modul3

## MY Fitlife

MY Fitlife adalah aplikasi yang membantu pengguna dalam mengatur jadwal olahraga serta memantau informasi Body Mass Index (BMI). Aplikasi ini memiliki dua fitur utama yaitu MY Workout Schedule, yang memungkinkan pengguna untuk mengelola jadwal olahraga dengan mudah, termasuk menandai (ceklis) setiap sesi yang telah dilakukan. Selain itu, fitur MY Body menyediakan informasi mengenai berat badan, tinggi badan, dan perhitungan BMI.


### Main.dart
Main untuk mengarahkan aplikasi flutter diawal ke halaman login serta membuat title yaitu 'Flutter Menu'
```
 Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Menu',
      home: LoginPage(),
    );
  }
```

### Login

Untuk membuat form username dan password yang akan ditangani controllernya masing-masing
```
_showInput(_usernameController, 'Username', false),
_showInput(_passwordController, 'Password', true),
```

Button yang akan cek apakah username password benar atau salah lalu menampilkan alert
```
onPressed: () {
                  if (_usernameController.text == 'activelife' &&
                      _passwordController.text == 'pass') {
                    //save username
                    _saveUsername();
                    //show alert
                    _showDialog('Login Successfully', const HomePage());
                  } else {
                    //show alert
                    _showDialog(
                        'Wrong Username or Password', const LoginPage());
                  }
                },
```

Input akan dimasukkan da disimpan ke SharedPreferences
```
void _saveUsername() async {
    //inisialisasi shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //simpan username ke local storage
    prefs.setString('username', _usernameController.text);
  }
```


### Home Page

- Menyimpan status checkbox
- Reload status checkbox cek apakah sudah di centang atau belum
- Function untuk menyimpan status checkbox ke SharedPreferences
- Function untuk memuat status checkbox dari SharedPreferences
```
class _HomePageState extends State<HomePage> {
  var namauser;
  List<bool> _isChecked =
      List.generate(30, (index) => false); 

  @override
  void initState() {
    super.initState();
    _getUsername();
    _loadCheckBoxState();
  }

  void _loadCheckBoxState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedCheckedState = prefs.getStringList('checkboxState');
    if (savedCheckedState != null) {
      setState(() {
        _isChecked = savedCheckedState.map((e) => e == 'true').toList();
      });
    }
  }

  void _saveCheckBoxState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> stringCheckedState =
        _isChecked.map((e) => e.toString()).toList();
    await prefs.setStringList('checkboxState', stringCheckedState);
  }
```


### About Page

Dibawah ini adalah salah satu contoh untuk menampilkan informasi tubuh yaitu tinggi badan. Selanjutnya menampilkan berat badan dan BMI sama saja

```
Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Height:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    '158 cm',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
```

Dibawah ini adalah untuk menampilkan informasi bahwa BMI kita normal
```
Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: const Text(
                  'Your BMI is Normal!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Based on your height and weight, your BMI is within the normal range.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ),
```


### Side Menu

ListTile untuk menampilkan menu bar dan mengarahkan ke halaman yang dituju jika menu dipilih
```
ListTile(
            leading: const Icon(Icons.home, color: Colors.green), 
            title: const Text(
              'MY Workout',
              style: TextStyle(
                color: Colors.green, 
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
```


### Demo

![image](https://github.com/user-attachments/assets/65c483b5-4f01-482b-b6c4-29ea381e75c8)
![image](https://github.com/user-attachments/assets/64d825bf-6174-44b1-844e-5f005502e7e3)
![image](https://github.com/user-attachments/assets/3e6121b9-c68e-47b3-a5fb-2d8d374ecf13)
![image](https://github.com/user-attachments/assets/3074c70a-7fa2-4214-9d60-2b7d65e52fe6)
![image](https://github.com/user-attachments/assets/ed5aa0b8-1ded-484b-915b-8d22349ffaa6)
![image](https://github.com/user-attachments/assets/8af45dac-d486-4f41-b145-24996b2e83b2)






