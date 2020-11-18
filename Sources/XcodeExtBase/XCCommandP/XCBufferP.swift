

public protocol XCRangeP {}


public protocol XCBufferP  {

    
    //MARK: - insert
    
    @discardableResult
    func insert(_ str: Str,
                after index: Int) -> Bool
    
    @discardableResult
    func insertAfterSelection(_ str: Str) -> Bool
    
    /// insert text at the very bottom
    func addAtTheBottom(_ str: Str)
    
    
    //MARK: - replace
    
    @discardableResult
    func removeSelectedLines() -> Bool
    
    @discardableResult
    func replaceSelectedLines(with str: Str) -> Bool

    
    
    //MARK: - select
  
    @discardableResult
    func selectLines(startIndex: Int,
                     endIndex: Int) -> Bool
    
    /// returns selected line indexes, if any
    var selectedLineIndexes: Set<Int>? {get}
    
    
    //MARK: -

    /// returns last selected line indexe, if any is selected
    var lastSelectedLineIdx: Int? {get}

    /// returns selected lines (if any), trimmed from newLine, in line order
    var selectedLines: [Str]? {get}
    
    var selectedRange: NSRange? {get}
    
    var selectedXCRange: XCRangeP? {get}
    
    @discardableResult
    func select(_ rng: XCRangeP) -> Bool
    
    var hasSelection: Bool {get}
    
    
    var _lines: [Str] {get}
    
    //TODO: validate range, return optional
    func lines(in rng: NSRange) -> [Str]
    
    /// The complete buffer's string representation, as a convenience. Changes to `lines` are immediately reflected in this property, and vice versa
    var finalText: Str {get}
}
