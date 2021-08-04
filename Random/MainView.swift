import SwiftUI

struct MainView {
  @State private var value: String = ""
    private let numbers = Model().makeIterator()
    
}

extension MainView: View {
  var body: some View {
    VStack (spacing: 40) {
      Text(value)
      Button("Next",
             action: nextNumber)
    }
  }
}

extension MainView {
  private func nextNumber() {
      if let number = numbers.next() {
          value = number.description
      } else {
          value = "No more values"
      }
  }
}

