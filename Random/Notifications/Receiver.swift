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
        
        let notifications = NotificationCenter.default.notifications(named: randomNumberNotification, object: nil) // By passing nil, we are not filtering by object type
        
        // The new way
        // We'd like to do this
        for await notification in notifications {
            if let object = notification.object as? Notifier {
                // Get the number provided by the notification
                self.number = object.number
            }
        }
        
//        // The old way
//        NotificationCenter.default.addObserver(forName: randomNumberNotification,
//                                               object: nil,
//                                               queue: nil) { notification in
//
//            // What do we want to do with the notification?
//            // Make sure we have a Notifier object
//            // If not, just ignore the notification
//            if let object = notification.object as? Notifier {
//                // Get the number provided by the notification
//                self.number = object.number
//            }
//        }
        
    }
}
