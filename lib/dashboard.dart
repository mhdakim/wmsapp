import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'new_incoming.dart';
import 'incoming.dart'; 
import 'scan_to_store.dart';
import 'scan_to_pick.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DashboardPage(),
    );
  }
}
class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 8.0, left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Welcome, Luqman', style: TextStyle(color: Color(0xFF00124E), fontSize: 25, fontWeight: FontWeight.bold)),
                    Text('Sign In at Wednesday, 15:39', style: TextStyle(color: Color(0xFF00124E), fontSize: 16)),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person, color: Color(0xFF00124E), size: 30),
              ),
            ],
          ),
        ),
        toolbarHeight: 100,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewIncomingPage())),
              child: _buildMenuItem(Icons.add, 'New Incoming', Colors.blue),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => IncomingPage())), // Navigasi ke 'IncomingPage'
              child: _buildMenuItem(Icons.file_open_outlined, 'Incoming', Colors.green),
            ),
             GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ScanToStorePage())), // Navigasi ke 'ScanToStorePage'
              child: _buildMenuItem(Icons.storage, 'Scan to Store', Colors.green),
            ),
             GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ScanToPickPage())), // Navigasi ke 'IncomingPage'
              child: _buildMenuItem(Icons.outbox, 'Scan to Pick', Colors.red),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF00124E),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[400],
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.storage), label: 'Scan to Store'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'New'),
            BottomNavigationBarItem(icon: Icon(Icons.outbox), label: 'Scan to Pick'),
            BottomNavigationBarItem(icon: Icon(Icons.exit_to_app), label: 'Log Out'),
          ],
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardPage()));
                break;
              case 1:
                Navigator.push(context, MaterialPageRoute(builder: (context) => IncomingPage())); // Navigasi pada BottomNavigationBar
                break;
              case 2:
                Navigator.push(context, MaterialPageRoute(builder: (context) => NewIncomingPage()));
                break;
              case 4:
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const SplashScreen()),
                  (Route<dynamic> route) => false,
                );
                break;
            }
          },
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, Color color) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: color, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 50, color: color),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
      ),
    );
  }
}
