import 'package:flutter/material.dart';

import '../../models/item.dart';

class Popular extends StatelessWidget {
  const Popular({super.key, required this.item, required this.onTap});
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
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item.imageUrl,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              fontFamily: 'Inter',
                            ),
                      ),
                      Text(
                        item.description,
                        style: Theme.of(context).textTheme.bodySmall!.apply(
                              fontFamily: 'Inter',
                              color: Colors.grey,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  '${item.price} ETB',
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        fontFamily: 'Inter',
                        color: Colors.blue,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}