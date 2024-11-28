import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'new_incoming.dart';
import 'incoming.dart';
import 'dashboard.dart';

class ScanToStorePage extends StatefulWidget {
  @override
  _ScanToStorePageState createState() => _ScanToStorePageState();
}

class _ScanToStorePageState extends State<ScanToStorePage> {
  final TextEditingController itemController = TextEditingController();
  final TextEditingController positionController = TextEditingController();

  void clearForm() {
    setState(() {
      itemController.clear();
      positionController.clear();
    });
  }

  void validateForm() {
    if (itemController.text.isNotEmpty && positionController.text.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Validation Successful"),
          content: Text("The item and position have been validated."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Validation Error"),
          content: Text("Please fill in all the required fields."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan to Store"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildSectionTitle("ITEM"),
            buildTextField("Scan Item", Icons.document_scanner, itemController),
            const SizedBox(height: 20),
            buildSectionDetails(),
            const SizedBox(height: 30),
            buildSectionTitle("POSITION"),
            buildTextField("Scan Position", Icons.document_scanner, positionController),
            const SizedBox(height: 20),
            buildPositionDetails(),
            const SizedBox(height: 30),
            buildButtons(),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget buildTextField(String hint, IconData icon, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        suffixIcon: Icon(icon),
        hintText: hint,
      ),
    );
  }

  Widget buildSectionDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("SFI Unit:"),
        Text("Item Ref ID:"),
        Text("Customer:"),
        Text("Invoice No:"),
        Text("Status:"),
        Text("Item Position:"),
      ],
    );
  }

  Widget buildPositionDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Type:"),
        Text("Zone Name:"),
        Text("Location:"),
        Text("Status:"),
      ],
    );
  }

  Widget buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: clearForm,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: Text("Clear"),
        ),
        ElevatedButton(
          onPressed: validateForm,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: Text("Validate"),
        ),
      ],
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => IncomingPage()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewIncomingPage()),
            );
            break;
          case 4:
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => SplashScreen()),
              (Route<dynamic> route) => false,
            );
            break;
        }
      },
    );
  }
}
