import 'package:flutter/material.dart';

import '../../models/item.dart';
class Specials extends StatelessWidget {
  const Specials({super.key,  required this.onTap, required this.item});
  final CafeItem item;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
          color: Colors.transparent,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            width: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                  16, 16, 16, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        item.imageUrl,
                        width: 128,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.bodyLarge!.apply(
                        fontFamily: 'Inter',
                        color: Colors.black, // Define the color manually
                      ),
                  ),
                
                  Text(
                    '${item.price} ETB',
                    style: Theme.of(context).textTheme.bodySmall!.apply(
                        fontFamily: 'Inter',
                        color: Colors.blue, // Define the color manually
                      ),
                    ),
                  // ElevatedButton(
                  //   onPressed: (){ print('order placed');},
                  //   style: ElevatedButton.styleFrom(
                  //           backgroundColor: Colors.brown, // Set the background color
                  //           elevation: 8, // Set elevation (shadow)
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(4), // Rounded corners
                  //           ),), 
                  //   child: Text('Place order', style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.white),), ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

