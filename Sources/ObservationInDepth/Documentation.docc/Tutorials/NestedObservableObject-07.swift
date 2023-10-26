final class Parent {
    @ObservationTracked var child: Child

    init(child: Child) {
        self.child = child
    }


    @ObservationIgnored private let _$observationRegistrar = Observation.ObservationRegistrar()

    internal nonisolated func access<Member>(
        keyPath: KeyPath<Parent , Member>
    ) {
        _$observationRegistrar.access(self, keyPath: keyPath)
    }

    internal nonisolated func withMutation<Member, MutationResult>(
        keyPath: KeyPath<Parent , Member>,
        _ mutation: () throws -> MutationResult
    ) rethrows -> MutationResult {
        try _$observationRegistrar.withMutation(of: self, keyPath: keyPath, mutation)
    }
}

extension Parent: Observation.Observable {
}

final class Child {
    var age: Int{
        @storageRestrictions(initializes: _age)
        init(initialValue) {
            _age = initialValue
        }

        get {
            access(keyPath: \.age)
            return _age
        }

        set {
            withMutation(keyPath: \.age) {
                _age = newValue
            }
        }
    }

    init(age: Int) {
        self.age = age
    }

    func haveBirthday() {
        age += 1
    }


    @ObservationIgnored private let _$observationRegistrar = Observation.ObservationRegistrar()

    internal nonisolated func access<Member>(
        keyPath: KeyPath<Child , Member>
    ) {
        _$observationRegistrar.access(self, keyPath: keyPath)
    }

    internal nonisolated func withMutation<Member, MutationResult>(
        keyPath: KeyPath<Child , Member>,
        _ mutation: () throws -> MutationResult
    ) rethrows -> MutationResult {
        try _$observationRegistrar.withMutation(of: self, keyPath: keyPath, mutation)
    }
}

extension Child: Observation.Observable {
}
