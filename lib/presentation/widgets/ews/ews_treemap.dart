import 'package:flutter/material.dart';
import 'package:flutter_treemap/flutter_treemap.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class EwsTreemap extends StatelessWidget {
  const EwsTreemap({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    List<Treemap> nodes = [
      Treemap(
        value: 236,
        label: 'Gangguan Pembangkit',
        color: colorScheme.primary,
      ),
      Treemap(value: 23, label: 'HOP Coal', color: colorScheme.primary),
      Treemap(value: 22, label: 'Energy Sales', color: colorScheme.primary),
      Treemap(value: 6, label: 'Outage Transmisi', color: colorScheme.primary),
      Treemap(value: 1, label: 'Harga Batubara', color: colorScheme.primary),
      Treemap(value: 1, label: 'Kurs Dollar', color: colorScheme.primary),
    ];
    return FlutterTreemap(
      nodes: nodes,
      border: Border.all(color: Colors.white, width: 2),
      tileWrapper: (context, child, node, index, rect) {
        final tooltipController = JustTheController();
        return JustTheTooltip(
          controller: tooltipController,
          showDuration: Duration(seconds: 3),
          triggerMode: TooltipTriggerMode.tap,
          backgroundColor: const Color.fromARGB(
            255,
            34,
            34,
            34,
          ).withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(8),
          tailLength: 10.0,
          tailBaseWidth: 15.0,
          content: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Text(
                        '${node.label} : ${node.value}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FilledButton(
                          onPressed: () {
                            // Tambahkan aksi deep dive kamu
                          },
                          child: const Text('Deep Dive'),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: -15,
                  right: -15,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      size: 20,
                      color: Colors.white70,
                    ),
                    onPressed: () {
                      tooltipController.hideTooltip();
                    },
                  ),
                ),
              ],
            ),
          ),
          child: child,
        );
      },
      tileBuilder: (context, node, index, rect) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              node.label ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(
              '${node.value.toInt()}',
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        );
      },
    );
  }
}
