import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/score/score_bloc.dart';
import 'rich_dialog.dart';

class FlutterLayer extends StatelessWidget {
  const FlutterLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var snackBarFour = SnackBar(
        content: Text(
      'Congratulations!.  You have 4 gems.',
      style: Theme.of(context).textTheme.displayMedium,
    ));
    return BlocConsumer<ScoreBloc, ScoreState>(
      listener: (context, state) {
        if (state.score == 2) {
          showDialog(
              context: context,
              builder: ((BuildContext context) {
                return const RichDialog();
              }));
        } else if (state.score == 4) {
          ScaffoldMessenger.of(context).showSnackBar(snackBarFour);
        }
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Score: ${state.score}'),
            TextButton(
              onPressed: () {
                context.read<ScoreBloc>().add(IncreaseScoreEvent());
              },
              child: const Text('+ score'),
            ),
          ],
        );
      },
    );
  }
}
