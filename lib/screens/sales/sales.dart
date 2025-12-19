import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/erpcards.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}
class _SalesState extends State<Sales> {
  int selectedTab = 0;
  final List<String> tabs = ["Functionalities", "Reports", "Setups"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      // ===================== APP BAR =====================
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1976D2), Color(0xFF42A5F5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            "Sales",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
      ),

      // ===================== BODY =====================
      body: Column(
        children: [
          const SizedBox(height: 60),
          // ===================== ROUNDED TABS =====================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: List.generate(
                tabs.length,
                    (index) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: selectedTab == index
                            ? const Color(0xFF1976D2)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          if (selectedTab == index)
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                        ],
                      ),
                      child: Text(
                        tabs[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: selectedTab == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ===================== TAB CONTENT =====================
          Expanded(child: _buildTabContent()),
        ],
      ),
    );
  }

  // ===================== TAB CONTENT SWITCH =====================
  Widget _buildTabContent() {
    switch (selectedTab) {
      case 0:
        return _functionalitiesTab();
      case 1:
        return _reportsTab();
      case 2:
        return _setupTab();
      default:
        return const SizedBox();
    }
  }

  // ===================== FUNCTIONALITIES =====================
  Widget _functionalitiesTab() {
    final screenWidth = MediaQuery.of(context).size.width;
    final columns = (screenWidth ~/ 120).clamp(2, 4);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        crossAxisCount: columns, // same style as dashboard
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.95,
        children: [
          ErpCard(
            title: "List of Services",
            icon: Icons.design_services,
            color: Colors.blue,
            onTap: () {},
          ),
          ErpCard(
            title: "Distribution Rate List",
            icon: Icons.price_change,
            color: Colors.green,
            onTap: () {},
          ),
          ErpCard(
            title: "Quotation",
            icon: Icons.request_quote,
            color: Colors.orange,
            onTap: () {},
          ),
          ErpCard(
            title: "Quotation A/P",
            icon: Icons.verified,
            color: Colors.purple,
            onTap: () {},
          ),
          ErpCard(
            title: "Work Order / Book Order",
            icon: Icons.assignment,
            color: Colors.teal,
            onTap: () {},
          ),
          ErpCard(
            title: "Delivery Challan",
            icon: Icons.local_shipping,
            color: Colors.indigo,
            onTap: () {},
          ),
          ErpCard(
            title: "Delivery Acknowledgement",
            icon: Icons.assignment_turned_in,
            color: Colors.deepOrange,
            onTap: () {},
          ),
          ErpCard(
            title: "Pending Orders",
            icon: Icons.pending_actions,
            color: Colors.red,
            onTap: () {},
          ),
          ErpCard(
            title: "Sales Invoice (With Tax)",
            icon: Icons.receipt_long,
            color: Colors.blueGrey,
            onTap: () {},
          ),
          ErpCard(
            title: "Sales Invoice (Without Tax)",
            icon: Icons.receipt,
            color: Colors.greenAccent,
            onTap: () {},
          ),
          ErpCard(
            title: "Sales Return",
            icon: Icons.keyboard_return,
            color: Colors.black87,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  // ===================== REPORTS =====================
  Widget _reportsTab() {
    final screenWidth = MediaQuery.of(context).size.width;
    final columns = (screenWidth ~/ 120).clamp(2, 4);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        crossAxisCount: columns,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.95,
        children: [
          ErpCard(
            title: "Date-wise Sales",
            icon: Icons.date_range,
            color: Colors.blue,
            onTap: () {},
          ),
          ErpCard(
            title: "Credit Card Sale",
            icon: Icons.credit_card,
            color: Colors.green,
            onTap: () {},
          ),
          ErpCard(
            title: "Credit Sales",
            icon: Icons.account_balance_wallet,
            color: Colors.orange,
            onTap: () {},
          ),
          ErpCard(
            title: "Date-wise Sales Summary",
            icon: Icons.insert_chart,
            color: Colors.red,
            onTap: () {},
          ),
          ErpCard(
            title: "Category Sale",
            icon: Icons.category,
            color: Colors.teal,
            onTap: () {},
          ),
          ErpCard(
            title: "Item-wise Sale",
            icon: Icons.inventory_2,
            color: Colors.indigo,
            onTap: () {},
          ),
          ErpCard(
            title: "Customer-wise Sale",
            icon: Icons.person,
            color: Colors.deepPurple,
            onTap: () {},
          ),
          ErpCard(
            title: "Supplier-wise Sale",
            icon: Icons.local_shipping,
            color: Colors.brown,
            onTap: () {},
          ),
          ErpCard(
            title: "Salesman-wise Sale",
            icon: Icons.people,
            color: Colors.blueGrey,
            onTap: () {},
          ),
          ErpCard(
            title: "Sales Search Mode",
            icon: Icons.search,
            color: Colors.greenAccent,
            onTap: () {},
          ),
          ErpCard(
            title: "Sales Summary",
            icon: Icons.summarize,
            color: Colors.orangeAccent,
            onTap: () {},
          ),


        ],
      ),
    );
  }

  // ===================== SETUPS =====================
  Widget _setupTab() {
    final screenWidth = MediaQuery.of(context).size.width;
    final columns = (screenWidth ~/ 120).clamp(2, 4);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        crossAxisCount: columns,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.95,
        children: [
          ErpCard(
            title: "Customer Information",
            icon: Icons.person,
            color: Colors.blue,
            onTap: () {},
          ),
          ErpCard(
            title: "Discount Types",
            icon: Icons.percent,
            color: Colors.green,
            onTap: () {},
          ),

        ],
      ),
    );
  }
}


