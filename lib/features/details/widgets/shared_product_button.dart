import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../home/service/models/product_model.dart';

class ShareProductButton extends StatelessWidget {
  final productModel product;

  const ShareProductButton({
    super.key,
    required this.product,
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
        final String vercelUrl =
            "https://rushing-scarlet-lxwsycr.tmp.now/product/${product.id ?? 1}";
        final String shareMessage = """
🛍️ *${product.title ?? 'Product'}*
💰 Price: *\$${product.price?.toStringAsFixed(2) ?? '0.00'}*

${product.description ?? ''}

🔗 View Web Details: $vercelUrl
""";
        await SharePlus.instance.share(ShareParams(text: shareMessage));
      },
    );
  }
}
