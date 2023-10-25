import SwiftUI
import Combine

final class Parent: ObservableObject {
    @Published var child: Child

    init(child: Child) {
        self.child = child
    }
}

final class Child: ObservableObject {
    @Published var age: Int

    init(age: Int) {
        self.age = age
    }

    func haveBirthday() {
        age += 1
    }
}

struct BirthdayView: View {
    @StateObject var parent = Parent(child: Child(age: 1))

    var body: some View {
        Text("child is \(parent.child.age) years old")

        Button("Have Birthday", action: { parent.child.haveBirthday() })
    }
}
