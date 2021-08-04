import SwiftUI

struct MainView {
  @State private var value: String = ""
  private let model = Model()
    
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
    print("You need to connect to the model")
  }
}

