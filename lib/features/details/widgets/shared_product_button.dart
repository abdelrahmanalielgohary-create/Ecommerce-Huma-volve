import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareProductButton extends StatelessWidget {
  final String productId;

  const ShareProductButton({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.share, size: 18),
      ),
      onPressed: () async {
        final String productLink = "https://ecommerce.app/product/$productId";
        final String shareMessage = "Check out this product on Huma-volve: $productLink";
        await SharePlus.instance.share(ShareParams(text: shareMessage));
      },
    );
  }
}
