import 'base_use_case.dart';

/// If a [UseCase] return a Future it needs extend this abstract class.
/// The [Param] type represents any data you need pass to do some action.
/// The [Result] type represents the expected return of [UseCase]

abstract class BaseFutureUseCase<Param, Result> extends BaseUseCase {
  Future<Result> call([Param params]);
}
