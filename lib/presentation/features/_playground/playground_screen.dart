import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/routes/router.gr.dart';

@RoutePage()
class PlaygroundScreen extends StatelessWidget {
  const PlaygroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playground'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

class PlaygroundScreenOpenerButton extends StatelessWidget {
  const PlaygroundScreenOpenerButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (kReleaseMode) {
      return const SizedBox.shrink();
    }

    return TextButton(
      onPressed: () {
        context.pushRoute(const PlaygroundRoute());
      },
      child: const Text(
        'Open Playground Screen',
      ),
    );
  }
}
