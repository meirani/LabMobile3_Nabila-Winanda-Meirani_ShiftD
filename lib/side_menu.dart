import 'package:flutter/material.dart';
import 'package:tugas_modul3/about_page.dart';
import 'package:tugas_modul3/home_page.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green, // Background header hijau
            ),
            child: Center(
              child: Text(
                'MY Fit Menu',
                style: TextStyle(
                  color: Colors.white, // Warna teks putih
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.green), // Ikon hijau
            title: const Text(
              'MY Workout',
              style: TextStyle(
                color: Colors.green, // Warna teks hijau
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
          ListTile(
            leading: const Icon(Icons.info, color: Colors.green), // Ikon hijau
            title: const Text(
              'MY Body',
              style: TextStyle(
                color: Colors.green, // Warna teks hijau
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
