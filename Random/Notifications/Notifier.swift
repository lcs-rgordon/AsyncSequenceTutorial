import Foundation

// Generates and posts a random number
let randomNumberNotification = Notification.Name("randomNumberNotification")

class Notifier {
  var number: Int = 0
  
  func postRandomNumber() {
    number = Int.random(in: 1...99)
    NotificationCenter.default
      .post(name: randomNumberNotification,
            object: self)
  }
}
