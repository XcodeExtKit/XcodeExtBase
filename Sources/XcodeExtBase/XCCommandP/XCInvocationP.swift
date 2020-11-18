

public protocol XCInvocationP {
    
    var lastSelectedLineIdx: Int? {get}
    
    var tabWidth: Int {get}
    
    var contentUTI: Str {get}
    
    /// selects lines in XCode
    @discardableResult
    func selectLines(startIndex: Int,
                     endIndex: Int) -> Bool
    
    /// inserts string at given index in buffer
    /// if it has linebreaks (newlines) - will immediately regenerate current buffer and create more lines
    @discardableResult
    func insert(_ str: Str, after index: Int) -> Bool
}
