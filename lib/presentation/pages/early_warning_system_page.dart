import 'package:flutter/material.dart';
import 'package:flutter_news/presentation/widgets/ews/ews_treemap.dart';
import 'package:flutter_news/presentation/widgets/layout/main_layout.dart';

class EarlyWarningSystemPage extends StatelessWidget {
  const EarlyWarningSystemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Early Warning System',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Key Risk Indicator in Warning',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 8),
              SizedBox(height: 500, child: EwsTreemap()),
              SizedBox(height: 100,)
            ],
          ),
        ),
      ),
    );
  }
}
