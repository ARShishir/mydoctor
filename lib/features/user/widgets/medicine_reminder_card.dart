import 'package:flutter/material.dart';

class MedicineReminderCard extends StatelessWidget {
  const MedicineReminderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  elevation: 0,
  color: Theme.of(context).colorScheme.surfaceContainerLowest,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  child: InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () {
      // এখানে ট্যাপ করলে মেডিসিন ডিটেইলস পেজে যাবে
      // context.go('/medicine/${medicine.id}');
    },
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // আইকন/ইমেজ কন্টেইনার
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.medication_liquid_rounded,
              size: 32,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          const SizedBox(width: 16),

          // মূল কন্টেন্ট
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'প্যারাসিটামল ৫০০ মি.গ্রা.',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.1,
                      ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'আজ সকাল ৮:০০ টা',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '১ টা ট্যাবলেট • খাবারের পর',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),

          // সুইচ + স্ট্যাটাস
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Switch(
                value: true, // পরে model থেকে আসবে
                onChanged: (value) {
                  // reminder toggle logic
                },
                activeColor: Theme.of(context).colorScheme.primary,
              ),
              Text(
                'সক্রিয়',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);
  }
}
