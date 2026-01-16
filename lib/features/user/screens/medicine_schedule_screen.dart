import 'package:flutter/material.dart';

class MedicineScheduleScreen extends StatefulWidget {
  const MedicineScheduleScreen({super.key});

  @override
  State<MedicineScheduleScreen> createState() => _MedicineScheduleScreenState();
}

class _MedicineScheduleScreenState extends State<MedicineScheduleScreen> {
  // ডামি ডেটা
  final List<Map<String, dynamic>> _schedules = [
    {
      'medicine': 'Napa 500mg',
      'dosage': '১ ট্যাবলেট',
      'time': TimeOfDay(hour: 8, minute: 0),
      'frequency': 'প্রতিদিন',
      'duration': '৭ দিন',
      'color': Colors.blue,
      'taken': true,
    },
    {
      'medicine': 'Ace 100mg',
      'dosage': '১ ট্যাবলেট',
      'time': TimeOfDay(hour: 13, minute: 30),
      'frequency': 'প্রতিদিন',
      'duration': '১০ দিন',
      'color': Colors.teal,
      'taken': false,
    },
    {
      'medicine': 'Losectil 20mg',
      'dosage': '১ ক্যাপসুল',
      'time': TimeOfDay(hour: 20, minute: 0),
      'frequency': 'রাতে খাবারের পর',
      'duration': '১৫ দিন',
      'color': Colors.purple,
      'taken': false,
    },
    {
      'medicine': 'Vitamin C 500mg',
      'dosage': '১ ট্যাবলেট',
      'time': TimeOfDay(hour: 9, minute: 0),
      'frequency': 'প্রতিদিন',
      'duration': '৩০ দিন',
      'color': Colors.orange,
      'taken': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ঔষধের সময়সূচী'),
        centerTitle: true,
        elevation: 0,
      ),

      body: Column(
        children: [
          // আজকের তারিখ ও সারাংশ কার্ড (শুধু তারিখ দেখানোর জন্য)
          Container(
            margin: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${now.day} ${getBanglaMonth(now.month)} ${now.year}",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'আজকের ঔষধ: ৪টি',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text(
                    '৪',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: _schedules.length,
              itemBuilder: (context, index) {
                final item = _schedules[index];
                final time = item['time'] as TimeOfDay;
                final isTaken = item['taken'] as bool;

                return MedicineScheduleCard(
                  medicine: item['medicine'],
                  dosage: item['dosage'],
                  time: time,
                  frequency: item['frequency'],
                  color: item['color'],
                  isTaken: isTaken,
                  onToggle: () {
                    setState(() {
                      _schedules[index]['taken'] = !isTaken;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('নতুন ঔষধ যোগ করুন'),
        icon: const Icon(Icons.add),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('নতুন ঔষধ যোগ করার ফিচার আসছে শীঘ্রই')),
          );
        },
      ),
    );
  }

  // সিম্পল বাংলা মাসের নাম (intl ছাড়াই)
  String getBanglaMonth(int month) {
    const months = [
      'জানুয়ারি', 'ফেব্রুয়ারি', 'মার্চ', 'এপ্রিল', 'মে', 'জুন',
      'জুলাই', 'আগস্ট', 'সেপ্টেম্বর', 'অক্টোবর', 'নভেম্বর', 'ডিসেম্বর'
    ];
    return months[month - 1];
  }
}

class MedicineScheduleCard extends StatelessWidget {
  final String medicine;
  final String dosage;
  final TimeOfDay time;
  final String frequency;
  final Color color;
  final bool isTaken;
  final VoidCallback onToggle;

  const MedicineScheduleCard({
    super.key,
    required this.medicine,
    required this.dosage,
    required this.time,
    required this.frequency,
    required this.color,
    required this.isTaken,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: isTaken ? 1 : 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onToggle,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      time.format(context), // ← এখানেই সব ম্যাজিক! ডিভাইসের লোকেল অনুযায়ী দেখাবে
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicine,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      dosage,
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.repeat, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(frequency, style: TextStyle(color: Colors.grey[700])),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 48,
                width: 48,
                child: Checkbox(
                  value: isTaken,
                  activeColor: color,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  onChanged: (v) => onToggle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}