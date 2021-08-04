import SwiftUI

struct MainView {
  @State private var value: String = ""
  private let numbers = Model()
    
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
      for number in numbers {
          print(number.description)
      }
  }
}

