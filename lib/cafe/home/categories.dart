import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.category, required this.icon, required this.onTap});
  final String category;
  final IconData icon;
  final VoidCallback onTap; 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0x33FFFFFF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 40,
                  ),
                  Text(
                    category,
                    style: Theme.of(context).textTheme
                        .bodyMedium!
                        .apply(
                          fontFamily: 'Inter',
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
    );
  }
}