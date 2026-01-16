// user_dashboard_screen.dart
import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../widgets/user_header.dart';
import '../widgets/medicine_reminder_card.dart';

// নিজের ফোল্ডার স্ট্রাকচার অনুযায়ী পাথ ঠিক করে নাও
import 'medical_documents_screen.dart';

import 'medicine_schedule_screen.dart';  

import 'hospital_services_screen.dart';
import 'local_pharmacy.dart';
// যদি ড্যাশবোর্ড অ্যাকশন কার্ড আলাদা ফাইলে থাকে তাহলে এটাও ইমপোর্ট করো
// import '../widgets/dashboard_action_card.dart';

// যদি আলাদা ফাইলে না রাখতে চাও তাহলে নিচের ক্লাসটা এখানেই রাখতে পারো
class DashboardActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const DashboardActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: color,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class UserDashboardScreen extends StatelessWidget {
  const UserDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('আমার ড্যাশবোর্ড'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        actions: [
          IconButton(
            icon: Badge(
              isLabelVisible: true,
              label: const Text('3'),
              child: const Icon(Icons.notifications_outlined),
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(milliseconds: 1200));
          // পরে এখানে আসল রিফ্রেশ লজিক আসবে
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.paddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // হেডার
                    const UserHeader(),
                    const SizedBox(height: 32),

                    // দ্রুত সেবা সেকশন
                    Text(
                      'দ্রুত সেবা',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(height: 16),

                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.05,
                      children: [
                        DashboardActionCard(
                          title: 'মেডিকেল ডকুমেন্ট',
                          subtitle: 'রিপোর্ট, প্রেসক্রিপশন',
                          icon: Icons.medical_information_outlined,
                          color: Colors.blue,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const MedicalDocumentsScreen(),
                              ),
                            );
                          },
                        ),
                        DashboardActionCard(
                          title: 'প্রেসক্রিপশন',
                          subtitle: 'সকল ঔষধের তালিকা',
                          icon: Icons.receipt_long_outlined,
                          color: Colors.teal,
                          
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const MedicineScheduleScreen(),
                              ),
                            );
                          },
                        ),
                        DashboardActionCard(
                          title: 'কাছের হাসপাতাল',
                          subtitle: 'লোকেশন অনুযায়ী',
                          icon: Icons.local_hospital_outlined,
                          color: Colors.redAccent,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const NearbyServicesScreen(),
                              ),
                            );
                          },
                        ),
                        DashboardActionCard(
                          title: 'ফার্মেসি',
                          subtitle: 'ঔষধ খুঁজুন',
                          icon: Icons.local_pharmacy_outlined,
                          color: Colors.deepPurple,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LocalPharmacyScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // আজকের ঔষধের সময়
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'আজকের ঔষধের সময়',
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward, size: 18),
                          label: const Text('সব দেখুন'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    const MedicineReminderCard(),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'add_medicine',
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        icon: const Icon(Icons.add),
        label: const Text('নতুন ঔষধ'),
        onPressed: () {
          // নতুন মেডিসিন যোগ করার স্ক্রিন
        },
      ),
    );
  }
}