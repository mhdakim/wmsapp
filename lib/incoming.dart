import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'new_incoming.dart';
import 'dashboard.dart';

class IncomingPage extends StatefulWidget {
  @override
  _IncomingPageState createState() => _IncomingPageState();
}

class _IncomingPageState extends State<IncomingPage> {
  final List<Map<String, String>> data = [
    {"Customer": "BAR", "Invoice": "234242535546"},
    {"Customer": "AJI", "Invoice": "646234865416"},
    {"Customer": "GBD", "Invoice": "685548284841"},
    {"Customer": "KIH", "Invoice": "894512828254"},
    {"Customer": "INF", "Invoice": "415684848452"},
    {"Customer": "QWS", "Invoice": "486548468852"},
    {"Customer": "VGF", "Invoice": "184864848485"},
    {"Customer": "QSD", "Invoice": "484418546444"},
  ];

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pending Incoming"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search :",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  // Filter data as user types
                  data.retainWhere((element) =>
                      element["Customer"]!.toLowerCase().contains(value.toLowerCase()) ||
                      element["Invoice"]!.contains(value));
                });
              },
            ),
            SizedBox(height: 20),
            // Table view
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text("Customer", style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Invoice No", style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Action", style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: data.map((item) {
                    return DataRow(cells: [
                      DataCell(Text(item["Customer"]!)),
                      DataCell(Text(item["Invoice"]!)),
                      DataCell(
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            // Add action here when edit button is clicked
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Edit ${item["Customer"]} selected.")),
                            );
                          },
                        ),
                      ),
                    ]);
                  }).toList(),
                ),
              ),
            ),
            // Pagination (Static for demonstration)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    // Previous page action
                  },
                ),
                SizedBox(width: 8),
                Text("1 / 2"), // Example pagination info
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    // Next page action
                  },
                ),
              ],
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
}
