import 'base_use_case.dart';

/// If a [UseCase] return a Stream it needs extend this abstract class.
/// The [Param] type represents any data you need pass to do some action.
/// The [Result] type represents the expected return of [UseCase]

abstract class BaseStreamUseCase<Param, Result> extends BaseUseCase {
  Stream<Result> call([Param params]);
}
