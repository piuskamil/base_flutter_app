class UnexpectedValueError extends Error {

  UnexpectedValueError();

  @override
  String toString() {
    const explanation =
        'Encountered a Failure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation');
  }
}