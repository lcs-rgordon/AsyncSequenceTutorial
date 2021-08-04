import SwiftUI

struct MainView {
  @State private var value: String = ""
  // Allows notifications to be posted
  private let notifier = Notifier()
   
  // Whenever the published property changes, this will get the update
  @StateObject private var receiver = Receiver()
}

extension MainView: View {
  var body: some View {
    VStack (spacing: 40) {
      Text(receiver.number.description)
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

