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

struct BirthdayView: View {
    @State var parent = Parent(child: Child(age: 1))

    var body: some View {
        Text("child is \(parent.child.age) years old")

        Button("Have Birthday", action: { parent.child.haveBirthday() })
    }
}
