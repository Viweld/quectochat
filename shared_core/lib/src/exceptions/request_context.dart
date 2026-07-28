/// Optional operation label attached to infrastructure errors for reporting.
final class RequestContext {
  const RequestContext({required this.operation, this.details});

  final String operation;
  final String? details;

  @override
  String toString() => 'RequestContext($operation${details == null ? '' : ', $details'})';
}
