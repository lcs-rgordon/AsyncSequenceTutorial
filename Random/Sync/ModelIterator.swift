// An iterator that gives you five elements between 1 and 99
class ModelIterator: IteratorProtocol {
    
    func next() -> Int? {
        return Int.random(in: 1...99)
    }
    
}
