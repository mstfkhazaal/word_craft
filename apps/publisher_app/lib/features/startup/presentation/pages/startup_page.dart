import 'package:auto_route/auto_route.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:publisher_app/features/startup/application/application_start/application_start_cubit.dart';
import 'package:publisher_app/features/startup/presentation/wigets/startup_failure_view.dart';
import 'package:publisher_app/features/startup/presentation/wigets/startup_loading_view.dart';
import 'package:publisher_app_ui/publisher_app_ui.dart';


@RoutePage()
class StartupPage extends StatefulWidget {
  const StartupPage({super.key});

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  bool _hasRequestedDestination = false;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!mounted || _hasRequestedDestination) {
        return;
      }

      _hasRequestedDestination = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ApplicationStartCubit, ApplicationStartState>(
          builder: (context, state) {
            if (state.startupStatus == ApplicationStartupStatus.failure) {
              return StartupFailureView(
                error: state.startupError,
                onRetry: _retry,
              );
            }

            return const StartupLoadingView();
          },
        ),
      ),
    );
  }



  Future<void> _retry() async {
  }
}
