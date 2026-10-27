import 'package:flutter/material.dart';
import '../../../core/theme.dart';
import '../../home/service/models/product_model.dart';
import '../widgets/shared_product_button.dart';
import '../../../core/widgets/primary_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  final productModel productModels;
  const ProductDetailsScreen({super.key, required this.productModels});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            backgroundColor: AppTheme.background,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back_ios_new, size: 16),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              ShareProductButton(
                productId: widget.productModels.id?.toString() ?? '1',
              ),
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.favorite_border, size: 18),
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'product-${widget.productModels.id}',
                child: widget.productModels.images != null && widget.productModels.images!.isNotEmpty
                    ? Image.network(
                        widget.productModels.images![0],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: AppTheme.background,
                          alignment: Alignment.center,
                          child: const Icon(Icons.image_not_supported_outlined),
                        ),
                      )
                    : Container(
                        color: AppTheme.background,
                        alignment: Alignment.center,
                        child: const Icon(Icons.image_not_supported_outlined),
                      ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              transform: Matrix4.translationValues(0.0, -32.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.productModels.title ?? "",
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              fontSize: 28,
                              height: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '\$${widget.productModels.price?.toStringAsFixed(2) ?? '0.00'}',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: AppTheme.primary,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.productModels.description ?? "",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        height: 1.6,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 32),
                    PrimaryButton(
                      text: 'Add to Cart',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${widget.productModels.title} added to cart'),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: AppTheme.primary,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
