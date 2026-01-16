import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../widgets/empty_state_widget.dart';

class NearbyServicesScreen extends StatelessWidget {
  const NearbyServicesScreen({super.key});

  // Enhanced dummy data
  final List<Map<String, dynamic>> _services = const [
    {
      'name': 'City Care Hospital',
      'type': 'Hospital',
      'distance': '1.2 km',
      'rating': 4.5,
      'isOpen': true,
      'color': Colors.blue,
      'icon': Icons.local_hospital,
    },
    {
      'name': 'Lifeline Diagnostic Center',
      'type': 'Diagnostic',
      'distance': '800 m',
      'rating': 4.2,
      'isOpen': true,
      'color': Colors.purple,
      'icon': Icons.biotech,
    },
    {
      'name': 'Green Pharmacy',
      'type': 'Pharmacy',
      'distance': '500 m',
      'rating': 4.6,
      'isOpen': true,
      'is24x7': true,
      'openHours': '24 Hours',
      'phone': '01712-345678',
      'color': Colors.green,
      'icon': Icons.local_pharmacy,
    },
    {
      'name': 'Health Plus Clinic',
      'type': 'Clinic',
      'distance': '2.1 km',
      'rating': 4.7,
      'isOpen': true,
      'color': Colors.orange,
      'icon': Icons.medical_services,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final hasServices = _services.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('কাছাকাছি সেবা'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          /// Search + Filter
          Padding(
            padding: const EdgeInsets.all(AppDimensions.paddingMedium),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'হাসপাতাল, ফার্মেসি খুঁজুন...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor:
                          colorScheme.surfaceVariant.withOpacity(0.4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.radiusLarge),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton.filledTonal(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          /// Services list
          Expanded(
            child: hasServices
                ? ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.paddingMedium),
                    itemCount: _services.length,
                    itemBuilder: (context, index) {
                      return _ServiceCard(service: _services[index]);
                    },
                  )
                : const EmptyStateWidget(
                    icon: Icons.location_off,
                    title: 'কোনো সেবা পাওয়া যায়নি',
                    subtitle: 'লোকেশন বা ফিল্টার পরিবর্তন করুন',
                  ),
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final Map<String, dynamic> service;

  const _ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    final color = service['color'] as Color;
    final isPharmacy = service['type'] == 'Pharmacy';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          /// Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  service['icon'],
                  color: color,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service['name'],
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      service['type'],
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              _OpenStatus(isOpen: service['isOpen']),
            ],
          ),

          const SizedBox(height: 12),

          /// Distance & Rating
          Row(
            children: [
              Icon(Icons.location_on,
                  size: 16, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(service['distance']),
              const SizedBox(width: 16),
              const Icon(Icons.star, size: 16, color: Colors.amber),
              const SizedBox(width: 4),
              Text(service['rating'].toString()),
            ],
          ),

          /// Pharmacy Extra Details
          if (isPharmacy) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.schedule,
                    size: 16, color: Colors.grey[600]),
                const SizedBox(width: 6),
                Text(service['openHours']),
                if (service['is24x7'] == true) ...[
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      '24/7',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                  ),
                ],
              ],
            ),
          ],

          /// Pharmacy Actions
          if (isPharmacy) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.call),
                    label: const Text('কল'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: color,
                      side: BorderSide(color: color),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              '${service['phone']} এ কল করা হচ্ছে...'),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.directions),
                    label: const Text('দিকনির্দেশ'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('ম্যাপ ফিচার শীঘ্রই আসছে'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}


class _OpenStatus extends StatelessWidget {
  final bool isOpen;

  const _OpenStatus({required this.isOpen});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isOpen
            ? Colors.green.withOpacity(0.15)
            : Colors.red.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isOpen ? 'খোলা' : 'বন্ধ',
        style: TextStyle(
          color: isOpen ? Colors.green : Colors.red,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }
}
