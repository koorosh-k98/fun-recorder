// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duration_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$durationHash() => r'296a60f6293e7cf3bf4df00279cd17c6a603bb05';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef DurationRef = AutoDisposeFutureProviderRef<Duration>;

/// See also [duration].
@ProviderFor(duration)
const durationProvider = DurationFamily();

/// See also [duration].
class DurationFamily extends Family<AsyncValue<Duration>> {
  /// See also [duration].
  const DurationFamily();

  /// See also [duration].
  DurationProvider call({
    required FileSystemEntity file,
  }) {
    return DurationProvider(
      file: file,
    );
  }

  @override
  DurationProvider getProviderOverride(
    covariant DurationProvider provider,
  ) {
    return call(
      file: provider.file,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'durationProvider';
}

/// See also [duration].
class DurationProvider extends AutoDisposeFutureProvider<Duration> {
  /// See also [duration].
  DurationProvider({
    required this.file,
  }) : super.internal(
          (ref) => duration(
            ref,
            file: file,
          ),
          from: durationProvider,
          name: r'durationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$durationHash,
          dependencies: DurationFamily._dependencies,
          allTransitiveDependencies: DurationFamily._allTransitiveDependencies,
        );

  final FileSystemEntity file;

  @override
  bool operator ==(Object other) {
    return other is DurationProvider && other.file == file;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, file.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
