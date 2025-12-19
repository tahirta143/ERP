import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/erpcards.dart';

class Hrmdashboard extends StatefulWidget {
  const Hrmdashboard({super.key});
  @override
  State<Hrmdashboard> createState() => _HrmdashboardState();
}

class _HrmdashboardState extends State<Hrmdashboard> {
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
            "Tasks Management",
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
            title: "Employee Information",
            icon: Icons.badge,
            color: Colors.blue,
            onTap: () {},
          ),
          ErpCard(
            title: "Manual Attendance",
            icon: Icons.edit_calendar,
            color: Colors.green,
            onTap: () {},
          ),
          ErpCard(
            title: "Leave Application",
            icon: Icons.event_note,
            color: Colors.orange,
            onTap: () {},
          ),
          ErpCard(
            title: "CPL Entry",
            icon: Icons.timer,
            color: Colors.red,
            onTap: () {},
          ),
          ErpCard(
            title: "Mark Absent",
            icon: Icons.cancel,
            color: Colors.teal,
            onTap: () {},
          ),
          ErpCard(
            title: "Official Holidays",
            icon: Icons.celebration,
            color: Colors.indigo,
            onTap: () {},
          ),
          ErpCard(
            title: "Travel Request",
            icon: Icons.flight_takeoff,
            color: Colors.deepPurple,
            onTap: () {},
          ),
          ErpCard(
            title: "Leave Approvals",
            icon: Icons.approval,
            color: Colors.brown,
            onTap: () {},
          ),
          ErpCard(
            title: "New Hiring Requisition",
            icon: Icons.person_add,
            color: Colors.blueGrey,
            onTap: () {},
          ),
          ErpCard(
            title: "CV Collection",
            icon: Icons.folder_shared,
            color: Colors.greenAccent,
            onTap: () {},
          ),
          ErpCard(
            title: "CV Comparison",
            icon: Icons.compare,
            color: Colors.orangeAccent,
            onTap: () {},
          ),
          ErpCard(
            title: "Job Offer Letter",
            icon: Icons.mail_outline,
            color: Colors.pinkAccent,
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
            title: "Employee List",
            icon: Icons.people_outline,
            color: Colors.blue,
            onTap: () {},
          ),
          ErpCard(
            title: "Employee Information",
            icon: Icons.badge_outlined,
            color: Colors.green,
            onTap: () {},
          ),
          ErpCard(
            title: "Employee Attendance",
            icon: Icons.how_to_reg,
            color: Colors.orange,
            onTap: () {},
          ),
          ErpCard(
            title: "Department-wise Attendance",
            icon: Icons.apartment,
            color: Colors.teal,
            onTap: () {},
          ),
          ErpCard(
            title: "Date-wise Attendance",
            icon: Icons.date_range,
            color: Colors.indigo,
            onTap: () {},
          ),
          ErpCard(
            title: "Date-wise Late Comings",
            icon: Icons.alarm,
            color: Colors.red,
            onTap: () {},
          ),
          ErpCard(
            title: "Date-wise Staff Overtime",
            icon: Icons.more_time,
            color: Colors.deepPurple,
            onTap: () {},
          ),
          ErpCard(
            title: "Date-wise Staff Leaves",
            icon: Icons.event_busy,
            color: Colors.brown,
            onTap: () {},
          ),
          ErpCard(
            title: "Monthly Attendance",
            icon: Icons.calendar_month,
            color: Colors.blueGrey,
            onTap: () {},
          ),
          ErpCard(
            title: "Monthly Salary Sheet",
            icon: Icons.receipt_long,
            color: Colors.greenAccent,
            onTap: () {},
          ),

        ],
      ),
    );
  }

  // ===== SETUPS =======
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
        ],
      ),
    );
  }
}


