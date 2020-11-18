

public extension XCCMDP {
    
    
    /// parses func interface and body
    func parseFuncDecl(_ lines: [Str],
                       usesTabs: Bool = false,
                       tabIndent: Int = 4) -> FuncDecl? {
        // use
        // parseFuncInterface
        // then the rest str - should contain body -> unwrap and parse statetments.split(by: "\n")
        // parseFuncBody - detect "{ ... }"
        fatalError()
    }
    
    
    /// if the func body is valid, i.e. has format "{ [statements] }"
    /// returns newLine separated lines
    func parseStatements(fromFuncBody funcBody: Str) -> [Str]? {
        
        fatalError()
    }
    
    /// [_ "cat: Cat", _ "dog: Dog"]
    func parseFuncInterface(_ line: Str) -> FuncInterface? {
        
        fatalError()
    }
}
