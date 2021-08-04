import SwiftUI

struct MainView {
  @State private var value: String = ""
  // Allows notifications to be posted
  private let notifier = Notifier()
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
      notifier.postRandomNumber()
  }
}

