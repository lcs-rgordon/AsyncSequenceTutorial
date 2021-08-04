class ModelIterator: IteratorProtocol {
    
    func next() -> Int? {
        return Int.random(in: 1...99)
    }
    
}
