

public extension Str {
    
    var numSpacesAtTheBeginning: Int {
        var r = 0
        for char in chars {
            if char == " " {
                r += 1
            } else {
                break
            }
        }
        return r
    }
    
    var numSpacesAtTheEnd: Int {
        reversed.numSpacesAtTheBeginning
    }
}
