import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimensions.dart';

class DocumentCard extends StatelessWidget {
  final String title;
  final String date;
  final String type;
  final String fileType;
  final Color color;
  final VoidCallback onTap;

  const DocumentCard({
    super.key,
    required this.title,
    required this.date,
    required this.type,
    required this.fileType,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spaceL),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
      ),
      elevation: 1.5,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.paddingMedium),
          child: Row(
            children: [
              // আইকন / থাম্বনেইল
              Container(
                width: 60,
                height: 70,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
                ),
                child: Icon(
                  _getFileIcon(fileType),
                  color: color,
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),

              // ডিটেইলস
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$type • $date',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),

              // ফাইল টাইপ ট্যাগ
              Chip(
                label: Text(fileType),
                backgroundColor: color.withOpacity(0.15),
                labelStyle: TextStyle(color: color, fontSize: 12),
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getFileIcon(String fileType) {
    switch (fileType.toUpperCase()) {
      case 'PDF':
        return Icons.picture_as_pdf_outlined;
      case 'JPG':
      case 'JPEG':
      case 'PNG':
        return Icons.image_outlined;
      default:
        return Icons.insert_drive_file_outlined;
    }
  }
}