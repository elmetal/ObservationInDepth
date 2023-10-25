import SwiftUI
import Combine

@Observable final class Parent {
    var child: Child

    init(child: Child) {
        self.child = child
    }
}

@Observable final class Child {
    var age: Int

    init(age: Int) {
        self.age = age
    }

    func haveBirthday() {
        age += 1
    }
}
