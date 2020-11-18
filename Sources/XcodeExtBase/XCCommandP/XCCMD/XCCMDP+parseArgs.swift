

/// Xcode command (for extension)
public protocol XCCMDP: NSObject, SwiftP {}


public extension XCCMDP {
    
    //TODO: test !
    
    
    /// "cat: Cat",
    func parseArg(_ line: Str) -> Arg? {
        
        let line = line.trim
        guard line.hasSth else {
            return nil
        }
        
        // what is this regex ?
        let regex = try! NSRegularExpression(pattern: "(?:var|let)\\s(\\w+)\\s?:\\s?(\\w+\\??)", options: [.caseInsensitive])
        
        let rng = line.nsRange
        //NSRange(location: 0, length: line.utf8.count)
        
        let matches = regex.matches(in: line,
                                    options: [],
                                    range: rng)
        
        guard let match1 = matches.first,
              match1.numberOfRanges >= 2 else {
            return nil
        }
        
        //TODO: try replace regex with func parseArg, or TypeName (Str?)
        let nsline = line as NSString
        let nameRange = match1.range(at: 1)
        let nameStr = nsline.substring(with: nameRange)
        
        let typeRange = match1.range(at: 2)
        let typeStr = nsline.substring(with: typeRange)
        
        //TODO: parse optional
        return .init(name: nameStr,
                     type: typeStr, optional: false)
    }
    
    func parseProperty(_ line: Str) -> Property? {
        // try use parseArg
        
        //        guard let str = line.trim else {
        //            return nil
        //        }
        //var mod: AccessMod?
        //if str.hasPrefix
        // try find AccessMod at the start
        // then for the rest Str - ask Arg(str)
        fatalError()
    }
    
    /// "_ cat: Cat",
    func parseFuncArg(_ line: Str) -> FuncArg? {
        // try use parseProperty
        
        //        guard let str = line.trim else {
        //            return nil
        //        }
        
        // try find "_" in prefix, then parse Arg in the rest Str
        fatalError()
    }
    
    
    
    //MARK: - many in line
    
    
    /// "cat: Cat", "dog: Dog"
    func parseArgs(_ line: Str,
                   separatedBy charSet: CharSet = CharSet([","])) -> [Arg]? {
        line.trim.split(by: charSet)?
            .compactMap{ parseArg($0) }
    }
    
    /// "public cat: Cat", "dog: Dog"
    func parseProperties(_ line: Str,
                         separatedBy charSet: CharSet = CharSet([","])) -> [Property]? {
        line.trim.split(by: charSet)?
            .compactMap{ parseProperty($0) }
    }
    
    /// "_ cat: Cat", "_ dog: Dog"
    func parseFuncArgs(_ line: Str,
                       separatedBy charSet: CharSet = CharSet([","])) -> [FuncArg]? {
        line.trim.split(by: charSet)?
            .compactMap{ parseFuncArg($0) }
    }
    
    
    //MARK: - lines
    
    
    /// "cat: Cat", "dog: Dog" - in func/init decl
    /// Each line can have multiple elements separated by the provided charSet
    func parseArgs(_ lines: [Str],
                   separatedBy charSet: CharSet = CharSet([","])) -> [Arg]? {
        lines.trim?.compactMap {
            parseArgs($0, separatedBy: charSet)
        }.flatMap{$0}
    }
    
    /// "public var cat: Cat", "dog: Dog"
    /// Each line can have multiple elements separated by the provided charSet
    func parseProperties(_ lines: [Str],
                         separatedBy charSet: CharSet = CharSet([","])) -> [Property]? {
        lines.trim?.compactMap {
            parseProperties($0, separatedBy: charSet)
        }.flatMap{$0}
    }
    
    
    /// "_ cat: Cat", "_ dog: Dog" - in func/init decl
    /// Each line can have multiple elements separated by the provided charSet
    func parseFuncArgs(_ lines: [Str],
                       separatedBy charSet: CharSet = CharSet([","])) -> [FuncArg]? {
        lines.trim?.compactMap {
            parseFuncArgs($0, separatedBy: charSet)
        }.flatMap{$0}
    }
}


//MARK: - private

private extension XCCMDP {
    
    
    //MARK: - single line
    
    
    /// "public var cat: Cat", "dog: Dog"
    private func parseComputedProperties(_ line: Str,
                                         separatedBy charSet: CharSet = CharSet([","])) -> [Property]? {
        fatalError()
        //lines.split(by: charSet)?.compactMap{ parseProperty($0) }
        //lines.trim?.parseLines(separatedBy: charSet)
    }
    
    /// "public var cat: Cat", "dog: Dog"
    private func parseStoredProperties(_ line: Str,
                                       separatedBy charSet: CharSet = CharSet([","])) -> [Property]? {
        fatalError()
        //lines.split(by: charSet)?.compactMap{ parseProperty($0) }
        //lines.trim?.parseLines(separatedBy: charSet)
    }
    
    //MARK: - many lines
    
    /// "public var cat: Cat", "dog: Dog"
    private func parseComputedProperties(_ lines: [Str],
                                         separatedBy charSet: CharSet = CharSet([","])) -> [Property]? {
        fatalError()
        //lines.split(by: charSet)?.compactMap{ parseProperty($0) }
        //lines.trim?.parseLines(separatedBy: charSet)
    }
    
    /// "public var cat: Cat", "dog: Dog"
    private func parseStoredProperties(_ lines: [Str],
                                       separatedBy charSet: CharSet = CharSet([","])) -> [Property]? {
        
        fatalError()
        //lines.split(by: charSet)?.compactMap{ parseProperty($0) }
        //lines.trim?.parseLines(separatedBy: charSet)
    }
}

