import SwiftUI

struct MainView {
  @State private var value: String = ""
  @State private var isRunning = false
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
      // Put this in a task because pressing the "Next" button cannot be asycnronous
      Task {
          await startSequence()
      }
  }
    
  private func startSequence() async {
      let numbers = AsyncStream(Int.self) { continuation in // Building a stream of Ints
          self.isRunning = true
          
          // Runs on a separate thread, detached
          Task.detached {
              while self.isRunning {
                  sleep(1)
                  // Put the result outside the task, so the "for await" can "hear" it
                  continuation.yield(Int.random(in: 1...99))
              }
          }
          
      }
      
      // Wait for the next number to pop out of the stream
      for await number in numbers {
          // Update the value
          self.value = number.description
      }
  }
}

