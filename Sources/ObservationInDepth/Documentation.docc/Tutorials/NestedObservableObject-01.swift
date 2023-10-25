import Combine

final class Parent: ObservableObject {
    @Published var child: Child
}

final class Child: ObservableObject {
    @Published var age: Int
}
