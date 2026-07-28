/// Typed success/failure outcome for expected business results.
///
/// Infrastructure errors propagate as exceptions instead.
sealed class Outcome<S, F> {
  const Outcome();

  bool get isSuccess => this is Success<S, F>;
  bool get isFailure => this is Failure<S, F>;

  S? get valueOrNull => switch (this) {
    Success<S, F>(:final S value) => value,
    Failure<S, F>() => null,
  };

  F? get failureOrNull => switch (this) {
    Success<S, F>() => null,
    Failure<S, F>(:final F error) => error,
  };
}

final class Success<S, F> extends Outcome<S, F> {
  const Success(this.value);

  final S value;
}

final class Failure<S, F> extends Outcome<S, F> {
  const Failure(this.error);

  final F error;
}
