import 'package:flutter/material.dart';

class BehaviorButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback onTap;
  final double scale;

  const BehaviorButton({
    Key? key,
    required this.icon,
    this.color = Colors.black,
    required this.text,
    required this.onTap,
    this.scale = 1.0,
  }) : super(key: key);

  @override
  _BehaviorButtonState createState() => _BehaviorButtonState();
}

class _BehaviorButtonState extends State<BehaviorButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: widget.scale).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant BehaviorButton oldWidget) {
    if (oldWidget.scale != widget.scale) {
      if (_animationController.isAnimating) {
        _animationController.stop();
      }
      _animationController.reset();
      _animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        _animationController.forward();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(
                  widget.icon,
                  size: 24,
                  color: widget.color,
                ),
                SizedBox(width: 4),
                Text(
                  widget.text,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
