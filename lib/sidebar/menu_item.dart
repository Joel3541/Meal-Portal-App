import 'package:flutter/material.dart'; 

class MenuItem extends StatelessWidget 
{

  final IconData? icon; // Allow null for icon
  final String title;

  const MenuItem({super.key, this.icon, required this.title, required Null Function() onTap});

  @override
  Widget build(BuildContext context) 
  {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          if (icon != null) // Display icon only if provided
            Icon(
              icon!,
              color: Colors.cyan,
              size: 20,
            ),
          if (icon != null) // Add space after icon only if displayed
            const SizedBox(width: 20),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
