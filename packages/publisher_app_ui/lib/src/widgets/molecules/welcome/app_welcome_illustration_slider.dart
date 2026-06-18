import 'dart:async';

import 'package:publisher_app_ui/publisher_app_ui.dart';

/// Immutable data for one welcome illustration slide.
class AppWelcomeSlide {
  /// Creates a welcome slide.
  const AppWelcomeSlide({
    required this.illustration,
    this.title,
    this.description,
    this.semanticLabel,
  });

  /// Main visual for the slide.
  final Widget illustration;

  /// Optional localized slide title.
  final String? title;

  /// Optional localized slide description.
  final String? description;

  /// Optional accessibility label for the visual.
  final String? semanticLabel;
}

/// Auto-playing welcome illustration slider with page indicators.
///
/// This molecule is UI-only. It does not own translations, routing, or state
/// outside of the current slider page. Pass already-localized slide titles and
/// descriptions from the app layer.
class AppWelcomeIllustrationSlider extends StatefulWidget {
  /// Creates an auto-playing welcome illustration slider.
  const AppWelcomeIllustrationSlider({
    required this.slides,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 4),
    this.animationDuration = const Duration(milliseconds: 350),
    this.animationCurve = Curves.easeOutCubic,
    this.viewportFraction = 1,
    this.showIndicator = true,
    this.indicatorSemanticLabel,
    this.onPageChanged,
    super.key,
  });

  /// Slides to render.
  final List<AppWelcomeSlide> slides;

  /// Whether the slider should move automatically.
  final bool autoPlay;

  /// Delay between automatic page changes.
  final Duration autoPlayInterval;

  /// Page transition duration.
  final Duration animationDuration;

  /// Page transition curve.
  final Curve animationCurve;

  /// Fraction of viewport occupied by each slide.
  final double viewportFraction;

  /// Whether to render the page indicator.
  final bool showIndicator;

  /// Localized semantic label for the page indicator group.
  final String? indicatorSemanticLabel;

  /// Optional callback when the active page changes.
  final ValueChanged<int>? onPageChanged;

  @override
  State<AppWelcomeIllustrationSlider> createState() =>
      _AppWelcomeIllustrationSliderState();
}

class _AppWelcomeIllustrationSliderState
    extends State<AppWelcomeIllustrationSlider> {
  late final PageController _controller;
  Timer? _timer;
  int _page = 0;

  bool get _canAutoPlay => widget.autoPlay && widget.slides.length > 1;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: widget.viewportFraction);
    _startTimer();
  }

  @override
  void didUpdateWidget(covariant AppWelcomeIllustrationSlider oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.autoPlay != widget.autoPlay ||
        oldWidget.autoPlayInterval != widget.autoPlayInterval ||
        oldWidget.slides.length != widget.slides.length) {
      _restartTimer();
    }

    if (_page >= widget.slides.length && widget.slides.isNotEmpty) {
      _page = widget.slides.length - 1;
      _controller.jumpToPage(_page);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.slides.isEmpty) {
      return const SizedBox.shrink();
    }

    final spacing = context.appSpacing;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.slides.length,
            onPageChanged: _handlePageChanged,
            itemBuilder: (context, index) {
              return _WelcomeSlideView(slide: widget.slides[index]);
            },
          ),
        ),
        if (widget.showIndicator && widget.slides.length > 1) ...[
          SizedBox(height: spacing.md),
          Semantics(
            label: widget.indicatorSemanticLabel,
            child: _WelcomePageIndicator(
              count: widget.slides.length,
              activeIndex: _page,
              onSelected: _animateToPage,
            ),
          ),
        ],
      ],
    );
  }

  void _handlePageChanged(int page) {
    if (!mounted) {
      return;
    }

    setState(() => _page = page);
    widget.onPageChanged?.call(page);
    _restartTimer();
  }

  void _startTimer() {
    _timer?.cancel();

    if (!_canAutoPlay) {
      return;
    }

    _timer = Timer.periodic(widget.autoPlayInterval, (_) async {
      if (!mounted || !_controller.hasClients || widget.slides.isEmpty) {
        return;
      }

      final nextPage = (_page + 1) % widget.slides.length;
      await _animateToPage(nextPage);
    });
  }

  void _restartTimer() {
    _timer?.cancel();
    _startTimer();
  }

  Future<void> _animateToPage(int page) async{
    if (!_controller.hasClients) {
      return;
    }

   await _controller.animateToPage(
      page,
      duration: widget.animationDuration,
      curve: widget.animationCurve,
    );
  }
}

class _WelcomeSlideView extends StatelessWidget {
  const _WelcomeSlideView({required this.slide});

  final AppWelcomeSlide slide;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final hasTitle = slide.title != null && slide.title!.trim().isNotEmpty;
    final hasDescription =
        slide.description != null && slide.description!.trim().isNotEmpty;

    return Semantics(
      label: slide.semanticLabel,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: spacing.xs),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: slide.illustration),
            if (hasTitle || hasDescription) ...[
              SizedBox(height: spacing.md),
              if (hasTitle)
                AppText.label(
                  slide.title!,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              if (hasTitle && hasDescription) SizedBox(height: spacing.xxs),
              if (hasDescription)
                AppText.caption(
                  slide.description!,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class _WelcomePageIndicator extends StatelessWidget {
  const _WelcomePageIndicator({
    required this.count,
    required this.activeIndex,
    required this.onSelected,
  });

  final int count;
  final int activeIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final isActive = index == activeIndex;

        return Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: spacing.xxs),
          child: _IndicatorDot(
            isActive: isActive,
            onPressed: () => onSelected(index),
          ),
        );
      }),
    );
  }
}

class _IndicatorDot extends StatelessWidget {
  const _IndicatorDot({
    required this.isActive,
    required this.onPressed,
  });

  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = isActive ? 22.0 : 8.0;

    return InkWell(
      onTap: onPressed,
      customBorder: const StadiumBorder(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        width: size,
        height: 8,
        decoration: ShapeDecoration(
          color: isActive
              ? colorScheme.primary
              : colorScheme.outlineVariant.withValues(alpha: 0.9),
          shape: const StadiumBorder(),
        ),
      ),
    );
  }
}
