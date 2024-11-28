import 'package:flutter/material.dart';
import 'dashboard.dart';  // Import if necessary for navigation
import 'splashscreen.dart'; // Import if navigation to splash screen is required

class NewIncomingPage extends StatefulWidget {
  @override
  _NewIncomingPageState createState() => _NewIncomingPageState();
}

class _NewIncomingPageState extends State<NewIncomingPage> {
  String? selectedCustomer;
  final TextEditingController invoiceController = TextEditingController();

  void resetForm() {
    setState(() {
      selectedCustomer = null;
      invoiceController.clear();
    });
  }

  void submitForm() {
    if (selectedCustomer != null && invoiceController.text.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Berjaya!"),
          content: Text("Maklumat telah dihantar."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            )
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Ralat!"),
          content: Text("Sila lengkapkan semua maklumat."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Incoming Form"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Customer *", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              value: selectedCustomer,
              items: [
                DropdownMenuItem(
                  value: "BAERLOCHER (M) SDN BHD",
                  child: Text("BAERLOCHER (M) SDN BHD"),
                ),
              ],
              onChanged: (value) => setState(() => selectedCustomer = value),
            ),
            SizedBox(height: 20),
            Text("Invoice Form *", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            TextFormField(
              controller: invoiceController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.document_scanner),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: resetForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text("Reset"),
                ),
                ElevatedButton(
                  onPressed: submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text("Submit"),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80, // Set the height via a container
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
              case 4:
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const SplashScreen()),
                  (Route<dynamic> route) => false,
                );
                break;
              // Add other cases if needed
            }
          },
        ),
      ),
    );
  }
}
