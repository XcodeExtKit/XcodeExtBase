

public typealias IdxComment = IndexedObj<Comment>

public extension XCCMDP {
    
    
    /// Can parse 3 types of comments - //, /// and /** */
    /// Before matching, the strings are trimmed from spaces and newLines
    func parseComment(_ line: Str) -> IdxComment? {
        //let str = line.trim
        
        fatalError()
        //line.trim?.parseStrInitables(separatedBy: charSet)
    }
    
    
    /// Can parse 3 types of comments - //, /// and /** */
    /// Before matching, the strings are trimmed from spaces and newLines
    func parseComments(_ lines: [Str]) -> [IdxComment]? {
        
        let allSubseqCombis = lines.allSubseqCombis
        // 1. try find all multiline comments - parseMultilineComment
        // parseMultilineComment
        
        // 2. the rest lines can start with // or ///
        // parseSingleLineComment
        
        fatalError()
        
        //line.trim.split(by: charSet)?.compactMap{ parseComment($0) }
    }
    
    
    //MARK: -
    
    /// parses the lines starting with /** and ends with */
    /// returns indexes of found matches
    /// before matching, the string is trimmed from spaces and newLines
    private func parseMultilineComment(_ lines: [Str]) -> [IdxComment]? {
        //let str = line.trim
        let allSubseqCombis = lines.allSubseqCombis
        
        
        //        switch style {
        //        case .multiline:
        //            return "/* " + strs.joinedLines + " */"
        //        case .doubleSlash:
        //            prefixStr += "// "
        //        case .tripleSlash:
        //            prefixStr += "/// "
        //        }
        fatalError()
        //line.trim?.parseStrInitables(separatedBy: charSet)
    }
    
    /// parses the lines starting with /** and ends with */
    /// Before matching, the string is trimmed from spaces and newLines
    private func parseMultilineComment(_ line: Str) -> Comment? {
        let str = line.trim
        
        if str.hasPrefix("/*") && str.hasSuffix("*/") {
            
            guard let str1 = str.removingLast(2)?.removingFirst(2)?.trim else {
                return nil
            }
            return Comment(str1, .multiline)
            
        } else if str.hasPrefix("//") {
            
            guard let str1 = str.removingFirst(2)?.trim else {
                return nil
            }
            return Comment(str1, .doubleSlash)
        }
        return nil
    }
    
    /// parses single multiline comment
    /// the array must contain at least one line starting with /** and a matching line (ending with */)
    /// Single line may contain both start and end
    /// returns indexes of the lines where the first match was found
    /// Before matching, the strings are trimmed from spaces and newLines
    private func parse(multilineComment: [Str]) -> IdxComment? {
        
        // not empty lines only
        guard let trimmedLines = multilineComment.trim else {
            return nil
        }
        
        func parseMultiComment(from combiSet: Set<IdxStr>) -> IdxComment? {
            
            let lines = combiSet.array
            let lineFirst = lines[0]
            
            guard lines.len > 1,
                  let lineLast = lines.last else {
                return nil
            }
            
            guard lineFirst.obj.hasPrefix("/*") && lineLast.obj.hasSuffix("*/") else {
                return nil
            }
            
            let lineFirstStr = lineFirst.obj.removingFirst(2)!
            let lineLastStr = lineLast.obj.removingLast(2)!
            
            let midIdxs = Array(1...(lines.len - 1))
            let midLines = lines.units(at: midIdxs)
            
//            let midLineComments: [IdxComment] = midLines.map {
//                IdxComment(idx: $0.idx, Comment($0, .multiline))
//            }

//            //TODO: handle empty comment
//            let commentLines: [IdxComment] = [lineFirstStr] + midLines + [lineLastStr]
            
            //TODO:
//            if let str = commentLines.trim {
//                let comment = Comment(str, .multiline)
//                return IdxComment(idx: <#T##Int#>, comment)
//            }
//
//            guard let commentLine = lineFirst.removingFirst(2)?.removingLast(2)?.trim else {
//                return nil
//            }
            fatalError()
//            let comment = Comment(commentLine, .multiline)
//            return IdxComment(idx: <#T##Int#>, comment)
        }
        
        for combiSet in trimmedLines.allSubseqCombis {
            if let a = parseMultiComment(from: combiSet) {
                return a
            }
        }
        
        // this is handled elsewhere
        //            if lineFirst.hasPrefix("//") {
        //                let str = lineFirst.removeFirst(2)
        //                return Comment(str, .doubleSlash)
        //            }
        
        return nil
    }
    
    /// parses the string (line) if it starts with // or ///
    /// Before matching, the strings are trimmed from spaces and newLines
    private func parseSingleLineComment(_ line: Str) -> Comment? {
        
        let str = line.trim
        if str.hasPrefix("///") {
            return Comment(str, .tripleSlash)
            
        } else if str.hasPrefix("//") {
            return Comment(str, .doubleSlash)
        }
        return nil
    }
}

