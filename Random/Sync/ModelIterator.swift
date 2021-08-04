// An iterator that gives you five elements between 1 and 99
class ModelIterator: IteratorProtocol {
    private(set) var count = 5
    
    func next() -> Int? {
        guard count > 0 else {
            return nil
        }
        count -= 1
        return Int.random(in: 1...99)
    }
    
}
