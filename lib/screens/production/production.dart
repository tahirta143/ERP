import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/erpcards.dart';

class Production extends StatefulWidget {
  const Production({super.key});

  @override
  State<Production> createState() => _ProductionState();
}

class _ProductionState extends State<Production> {
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
            "Production",
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
            title: "Production Order for Manufacturing",
            icon: Icons.assignment,
            color: Colors.blue,
            onTap: () {},
          ),
          ErpCard(
            title: "Create Production Batches",
            icon: Icons.add_box,
            color: Colors.green,
            onTap: () {},
          ),
          ErpCard(
            title: "Calculate Raw Material Against Production",
            icon: Icons.calculate,
            color: Colors.orange,
            onTap: () {},
          ),
          ErpCard(
            title: "Issue Raw Material Against Production Note",
            icon: Icons.inventory_2,
            color: Colors.purple,
            onTap: () {},
          ),
          ErpCard(
            title: "Area/Line Clearance Notes",
            icon: Icons.checklist,
            color: Colors.teal,
            onTap: () {},
          ),
          ErpCard(
            title: "Record Production Notes Against Each Phase",
            icon: Icons.note_alt,
            color: Colors.indigo,
            onTap: () {},
          ),
          ErpCard(
            title: "Test/Analysis Report of Each Production Phase",
            icon: Icons.science,
            color: Colors.deepOrange,
            onTap: () {},
          ),
          ErpCard(
            title: "Specimen/Datasheet of Manufactured Item",
            icon: Icons.description,
            color: Colors.brown,
            onTap: () {},
          ),
          ErpCard(
            title: "Destruction/Wastage Note",
            icon: Icons.delete_forever,
            color: Colors.red,
            onTap: () {},
          ),
          ErpCard(
            title: "Finished Goods Transfer Slip",
            icon: Icons.local_shipping,
            color: Colors.blueGrey,
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
            title: "Production Batch Report",
            icon: Icons.assignment,
            color: Colors.blue,
            onTap: () {},
          ),
          ErpCard(
            title: "Status / Progress of a Production Order",
            icon: Icons.timeline,
            color: Colors.green,
            onTap: () {},
          ),
          ErpCard(
            title: "Date-wise Raw Material Issuance",
            icon: Icons.inventory_2,
            color: Colors.orange,
            onTap: () {},
          ),
          ErpCard(
            title: "Date-wise Finished Goods to Store",
            icon: Icons.local_shipping,
            color: Colors.purple,
            onTap: () {},
          ),
          ErpCard(
            title: "Date-wise Wastage",
            icon: Icons.delete_forever,
            color: Colors.red,
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
            title: "Recipe of an Item Production",
            icon: Icons.receipt_long,
            color: Colors.blue,
            onTap: () {},
          ),
          ErpCard(
            title: "Phases of Production",
            icon: Icons.timeline,
            color: Colors.green,
            onTap: () {},
          ),



        ],
      ),
    );
  }
}


