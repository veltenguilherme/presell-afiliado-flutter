abstract class DiContainer {
  static final List<_Dependency> _dependencies = <_Dependency>[];

  static void addSingleton<TContract>({
    TContract Function()? builder,
    TContract? instance,
    String? name,
  }) =>
      _addDependency(
        TContract,
        _InstanceType.singleton,
        builder: builder,
        instance: instance,
        name: name,
      );

  static void addTransient<TContract>(
    TContract Function() builder, {
    String? name,
  }) =>
      _addDependency(
        TContract,
        _InstanceType.transient,
        builder: builder,
        name: name,
      );

  static T resolve<T>({String? name}) {
    _Dependency? dependency;

    final error = 'Dependency $T not found';

    if (name == null) {
      dependency = _dependencies.firstWhere(
        (x) => x.contract == T,
        orElse: () => throw error,
      );
    } else {
      dependency = _dependencies.firstWhere(
        (x) => x.name == name,
        orElse: () => throw error,
      );
    }

    return _buildInstance(dependency);
  }

  static List<T> resolveAll<T>() {
    final dependences = _dependencies.where((x) => x.contract == T);

    if (dependences.isEmpty) {
      throw 'Dependency $T not found';
    }

    final result = <T>[];

    for (final dependency in dependences) {
      final instance = _buildInstance(dependency);
      result.add(instance);
    }

    return result;
  }

  static List<T> resolveAllNotRequired<T>() {
    try {
      return resolveAll<T>();
    } catch (e) {
      return <T>[];
    }
  }

  static T? resolveNotRequired<T>({String? name}) {
    try {
      return resolve<T>(name: name);
    } catch (e) {
      return null;
    }
  }

  static void _addDependency(
    Type contract,
    _InstanceType type, {
    dynamic Function()? builder,
    dynamic instance,
    String? name,
  }) {
    final dependency = _Dependency(
      contract,
      builder,
      type,
      instance: instance,
      name: name,
    );

    _dependencies.add(dependency);
  }

  static _buildInstance(_Dependency dependency) {
    if (dependency.type == _InstanceType.transient) {
      return dependency.builder!();
    }

    if (dependency.type == _InstanceType.singleton &&
        dependency.instance == null) {
      dependency.instance = dependency.builder!();
    }

    return dependency.instance;
  }
}

enum _InstanceType {
  transient,
  singleton,
}

class _Dependency {
  final Type contract;
  final dynamic Function()? builder;
  final _InstanceType type;
  final String? name;

  dynamic instance;

  _Dependency(
    this.contract,
    this.builder,
    this.type, {
    this.instance,
    this.name,
  });
}
