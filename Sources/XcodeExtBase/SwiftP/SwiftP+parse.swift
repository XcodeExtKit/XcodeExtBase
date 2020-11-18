
@_exported import Base


public extension SwiftP {
    
    //MARK: - stateless utils
    
    // not static - for conv-nce
    
    
    //TODO: enum Interface model with cases FuncInterface and InitInterface

    /// accepts full func (interface + body), returned String is FuncInterface or InitInterface
    func extractInterface(fromFunc fullFunc: Str) -> Str? {
        
        // trim
        // validate func = has {}
        // get suffix until "{"
        // try validate the rest - by initing FuncInterface or InitInterface ?
        
        fatalError()
    }
    
    
    //TODO: Statement model
    
    /// accepts full func (interface + body)
    /// if the func has format: interface + { statements } - statements are returned
    func extractStatements(fromFullFunc fullFunc: Str) -> [Str]? {
        
        // trim
        // extractInterface(fromFullFunc
        // remove prefix
        // extractStatements(fromFuncBody
        fatalError()
    }
    
    /// if the String has format: + { [Statement] + "\n" } - statements are returned
    func extractStatements(fromFuncBody fbody: Str) -> [Str]? {
        
        //TODO: multi-line statements - should be parsed first
        unwrapFromBody(fbody)?.split(by: "\n")
    }
    
    
    /// if the Str has correct format - "{ \n\(indent)\(str)}\n }"
    /// returns func's body, trimmed from spaces and newlines
    func unwrapFromBody(_ blockStr: Str) -> Str? {
        
        blockStr.unwrap(suffix: "{",
                        prefix: "}",
                        trimAnySpacesAndNewLines: true,
                        allowMissing: false)
    }
}


