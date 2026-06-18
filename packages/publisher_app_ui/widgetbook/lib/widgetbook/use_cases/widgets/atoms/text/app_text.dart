import 'package:publisher_app_ui/publisher_app_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

/// All [AppText] semantic variants.
@widgetbook.UseCase(name: 'variants', type: AppText)
Widget variants(BuildContext context) {
  final spacing = context.appSpacing;

  return SingleChildScrollView(
    padding: EdgeInsets.all(spacing.lg),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppText.heading('Heading'),
        SizedBox(height: spacing.md),
        const AppText.body(
          'Body text for normal readable content in screens, cards, forms, '
          'tables, dialogs, and responsive layouts.',
        ),
        SizedBox(height: spacing.md),
        const AppText.caption('Caption text for secondary metadata.'),
        SizedBox(height: spacing.md),
        const AppText.label('Label text'),
        SizedBox(height: spacing.md),
        const AppText.error('Error text: Quantity is required.'),
        SizedBox(height: spacing.md),
        const AppText.success('Success text: Product saved successfully.'),
        SizedBox(height: spacing.md),
        const AppText.warning('Warning text: Low stock quantity.'),
        SizedBox(height: spacing.md),
        const AppText.info('Info text: Sync will start when online.'),
        SizedBox(height: spacing.md),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppText.label('Product name'),
            SizedBox(width: spacing.xxs),
            const AppText.requiredMark(),
          ],
        ),
      ],
    ),
  );
}

/// [AppText] form labels and validation messages.
@widgetbook.UseCase(name: 'form text', type: AppText)
Widget formText(BuildContext context) {
  final spacing = context.appSpacing;
  final colorScheme = Theme.of(context).colorScheme;

  return Center(
    child: Container(
      width: 420,
      padding: EdgeInsets.all(spacing.lg),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText.heading('Create Product'),
          SizedBox(height: spacing.lg),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppText.label('Product name'),
              SizedBox(width: spacing.xxs),
              const AppText.requiredMark(),
            ],
          ),
          SizedBox(height: spacing.xs),
          TextField(
            decoration: InputDecoration(
              hintText: 'Example: Tomato',
              border: const OutlineInputBorder(),
              contentPadding: EdgeInsets.all(spacing.md),
            ),
          ),
          SizedBox(height: spacing.xs),
          const AppText.error('Product name is required.'),
          SizedBox(height: spacing.lg),
          const AppText.caption(
            'Use a clear product name because it appears on invoices.',
          ),
        ],
      ),
    ),
  );
}

/// [AppText] Arabic and RTL preview.
@widgetbook.UseCase(name: 'arabic rtl', type: AppText)
Widget arabicRtl(BuildContext context) {
  final spacing = context.appSpacing;

  return Directionality(
    textDirection: TextDirection.rtl,
    child: SingleChildScrollView(
      padding: EdgeInsets.all(spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText.heading('إدارة المنتجات'),
          SizedBox(height: spacing.md),
          const AppText.body(
            'يمكنك إضافة المنتجات وتعديل الأسعار ومتابعة الكميات من هذه الشاشة.',
          ),
          SizedBox(height: spacing.md),
          const AppText.caption('آخر تحديث منذ ٥ دقائق'),
          SizedBox(height: spacing.md),
          const AppText.error('اسم المنتج مطلوب.'),
          SizedBox(height: spacing.md),
          const AppText.success('تم حفظ المنتج بنجاح.'),
          SizedBox(height: spacing.md),
          const AppText.warning('الكمية منخفضة في المخزون.'),
          SizedBox(height: spacing.md),
          const AppText.info('ستتم المزامنة عند توفر الاتصال.'),
          SizedBox(height: spacing.md),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppText.label('اسم المنتج'),
              SizedBox(width: spacing.xxs),
              const AppText.requiredMark(),
            ],
          ),
        ],
      ),
    ),
  );
}

/// [AppText] overflow behavior.
@widgetbook.UseCase(name: 'overflow', type: AppText)
Widget overflow(BuildContext context) {
  final spacing = context.appSpacing;

  return Center(
    child: SizedBox(
      width: 320,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText.label('Single line ellipsis'),
          SizedBox(height: spacing.xs),
          const AppText.body(
            'This is a very long product name that should be truncated '
            'when the available width is too small.',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: spacing.lg),
          const AppText.label('Two lines ellipsis'),
          SizedBox(height: spacing.xs),
          const AppText.body(
            'This is a longer description for a product inside Publisher POS. '
            'It should show only two lines and then use ellipsis.',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
