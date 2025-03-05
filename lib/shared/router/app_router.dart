
import 'package:bet_chip/ui/FirstView.dart';
import 'package:bet_chip/ui/SecondView.dart';
import 'package:go_router/go_router.dart';


final router = GoRouter(
  initialLocation: '/first',
  routes: [
    GoRoute(path: "/first", builder: (context,state) => FirstView()),
    GoRoute(path: "/second", builder: (context,state)
    {
      final numbers = state.extra as List<int>;
      return SecondView(numbers: numbers);
    }
    )
  ]
);