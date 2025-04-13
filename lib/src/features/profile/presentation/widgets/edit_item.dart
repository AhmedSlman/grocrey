import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditImageItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const EditImageItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Icon(icon, size: 28, color: Colors.grey.shade700),
          ),
          SizedBox(height: 8),
          Text(label, style: TextStyle(color: Colors.grey.shade700)),
        ],
      ),
    );
  }
}
