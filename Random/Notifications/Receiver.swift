import Foundation

// Publishes any new numbers that it receives notifications for
@MainActor
class Receiver: ObservableObject {
  @Published var number: Int = 0
    init() {
        Task {
            await registerForNotification()
        }
    }
}

extension Receiver {
    func registerForNotification() async {
        
        // By passing nil, we are not filtering by object type
        // Receiving a stream of notifications from randomNumberNotification
        // Transforming a stream of Any? into a Notifier object
        let numbers = NotificationCenter.default.notifications(named: randomNumberNotification,
                                                                     object: nil) // Stream of notifications
            .compactMap { notification in
                notification.object as? Notifier
            }   // Stream of Notifier that are non-nil
            .map(\.number) // Stream of Int
        
        for await number in numbers {
            // Get the number provided by the notification
            self.number = number
        }
        
    }
}
