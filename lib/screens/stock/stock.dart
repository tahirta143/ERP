import 'package:flutter/material.dart';

import '../../widgets/erpcards.dart';

class Stockscreen extends StatefulWidget {
  const Stockscreen({super.key});

  @override
  State<Stockscreen> createState() => _StockscreenState();
}

class _StockscreenState extends State<Stockscreen> {
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
            "Stocks",
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
            title: "List of Items",
            icon: Icons.list_alt,
            color: Colors.blue,
            onTap: () {
              // Navigate to list of items
            },
          ),
          ErpCard(
            title: "Opening Stock",
            icon: Icons.inventory,
            color: Colors.green,
            onTap: () {
              // Navigate to opening stock
            },
          ),
          ErpCard(
            title: "Stock Promotion",
            icon: Icons.campaign,
            color: Colors.orange,
            onTap: () {
              // Navigate to promotions
            },
          ),
          ErpCard(
            title: "Issue to Units",
            icon: Icons.call_split,
            color: Colors.purple,
            onTap: () {
              // Navigate to issue stock
            },
          ),
          ErpCard(
            title: "Return from Units",
            icon: Icons.undo,
            color: Colors.red,
            onTap: () {
              // Navigate to return stock
            },
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
            title: "Price List",
            icon: Icons.price_change,
            color: Colors.blue,
            onTap: () {
              // Navigate to Price List report
            },
          ),
          ErpCard(
            title: "Stock Position",
            icon: Icons.assessment,
            color: Colors.green,
            onTap: () {
              // Navigate to Stock Position
            },
          ),
          ErpCard(
            title: "Stock Price",
            icon: Icons.attach_money,
            color: Colors.orange,
            onTap: () {
              // Navigate to Stock Price
            },
          ),
          ErpCard(
            title: "Low Level Stock",
            icon: Icons.trending_down,
            color: Colors.red,
            onTap: () {
              // Navigate to Low Level Stock
            },
          ),
          ErpCard(
            title: "Item Ledger",
            icon: Icons.receipt_long,
            color: Colors.purple,
            onTap: () {
              // Navigate to Item Ledger
            },
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
            title: "Items Category",
            icon: Icons.category,
            color: Colors.blue,
            onTap: () {
              // Navigator to Items Category
            },
          ),
          ErpCard(
            title: "List of Categories",
            icon: Icons.list_alt,
            color: Colors.green,
            onTap: () {},
          ),
          ErpCard(
            title: "List of Subtitles",
            icon: Icons.subtitles,
            color: Colors.orange,
            onTap: () {},
          ),
          ErpCard(
            title: "List of Brands",
            icon: Icons.branding_watermark,
            color: Colors.purple,
            onTap: () {},
          ),
          ErpCard(
            title: "List of Locations",
            icon: Icons.location_on,
            color: Colors.red,
            onTap: () {},
          ),
          ErpCard(
            title: "List of Units",
            icon: Icons.straighten,
            color: Colors.teal,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
