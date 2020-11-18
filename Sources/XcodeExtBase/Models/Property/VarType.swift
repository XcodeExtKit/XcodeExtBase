

/// Variable type
public enum VarType: Hashable {

    case computedWithoutSetter
    
    case computedWithSetter

    case stored // var
    
    //case storedLet = "let" //TODO: ?
}
    
