import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/erpcards.dart';

class PurchaseDashboard extends StatefulWidget {
  const PurchaseDashboard({super.key});

  @override
  State<PurchaseDashboard> createState() => _PurchaseDashboardState();
}

class _PurchaseDashboardState extends State<PurchaseDashboard> {
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
            "Purchases",
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
            title: "Purchase Requisition",
            icon: Icons.assignment,
            color: Colors.blue,
            onTap: () {},
          ),
          ErpCard(
            title: "Requisition Approval",
            icon: Icons.verified,
            color: Colors.green,
            onTap: () {},
          ),
          ErpCard(
            title: "Supplier Quotations",
            icon: Icons.request_quote,
            color: Colors.orange,
            onTap: () {},
          ),
          ErpCard(
            title: "Comparative Statement",
            icon: Icons.compare_arrows,
            color: Colors.purple,
            onTap: () {},
          ),
          ErpCard(
            title: "Comparative Approval",
            icon: Icons.fact_check,
            color: Colors.teal,
            onTap: () {},
          ),
          ErpCard(
            title: "Purchase Order",
            icon: Icons.shopping_bag,
            color: Colors.indigo,
            onTap: () {},
          ),
          ErpCard(
            title: "Gate Pass (IN)",
            icon: Icons.login,
            color: Colors.deepOrange,
            onTap: () {},
          ),
          ErpCard(
            title: "Goods Inspection Note",
            icon: Icons.search,
            color: Colors.brown,
            onTap: () {},
          ),
          ErpCard(
            title: "Goods Receipt / Rejection",
            icon: Icons.assignment_turned_in,
            color: Colors.greenAccent,
            onTap: () {},
          ),
          ErpCard(
            title: "Gate Pass (OUT)",
            icon: Icons.logout,
            color: Colors.red,
            onTap: () {},
          ),
          ErpCard(
            title: " GRN",
            icon: Icons.inventory,
            color: Colors.blueGrey,
            onTap: () {},
          ),
          ErpCard(
            title: "Finished Goods Receipt",
            icon: Icons.factory,
            color: Colors.purpleAccent,
            onTap: () {},
          ),
          ErpCard(
            title: "Purchase Invoice",
            icon: Icons.receipt_long,
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
            title: "Date-wise Purchase Requisition",
            icon: Icons.date_range,
            color: Colors.blue,
            onTap: () {},
          ),
          ErpCard(
            title: "Item-wise Purchase Requisition",
            icon: Icons.inventory_2,
            color: Colors.green,
            onTap: () {},
          ),
          ErpCard(
            title: "Department-wise Purchase Requisition",
            icon: Icons.apartment,
            color: Colors.orange,
            onTap: () {},
          ),
          ErpCard(
            title: "Pending Purchase Requisition",
            icon: Icons.pending_actions,
            color: Colors.red,
            onTap: () {},
          ),
          ErpCard(
            title: "Date-wise Approved Requisition",
            icon: Icons.verified,
            color: Colors.teal,
            onTap: () {},
          ),
          ErpCard(
            title: "Date-wise Purchase Orders",
            icon: Icons.shopping_bag,
            color: Colors.indigo,
            onTap: () {},
          ),
          ErpCard(
            title: "Supplier-wise Purchase Orders",
            icon: Icons.local_shipping,
            color: Colors.deepPurple,
            onTap: () {},
          ),
          ErpCard(
            title: "Item-wise Purchase Orders",
            icon: Icons.category,
            color: Colors.brown,
            onTap: () {},
          ),
          ErpCard(
            title: "Date-wise Goods Receipt",
            icon: Icons.event_available,
            color: Colors.blueGrey,
            onTap: () {},
          ),
          ErpCard(
            title: "Item-wise Goods Receipt",
            icon: Icons.inventory,
            color: Colors.greenAccent,
            onTap: () {},
          ),
          ErpCard(
            title: "Supplier-wise Goods Receipt",
            icon: Icons.store,
            color: Colors.orangeAccent,
            onTap: () {},
          ),
          ErpCard(
            title: "Date-wise Gate Pass IN",
            icon: Icons.login,
            color: Colors.deepOrange,
            onTap: () {},
          ),
          ErpCard(
            title: "Date-wise Gate Pass OUT",
            icon: Icons.logout,
            color: Colors.redAccent,
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
            title: "Suppliers Information",
            icon: Icons.store,
            color: Colors.blue,
            onTap: () {},
          ),
          ErpCard(
            title: "Taxes Setup",
            icon: Icons.calculate,
            color: Colors.green,
            onTap: () {},
          ),


        ],
      ),
    );
  }
}


