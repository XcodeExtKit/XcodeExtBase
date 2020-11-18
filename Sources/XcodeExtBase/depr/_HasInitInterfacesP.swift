//
//
//public protocol HasInitInterfacesP: SwiftP {
//
//    var initInterfaces: [InitInterface] {get}
//}
//
//public extension HasInitInterfacesP {
//
//    /// makes a list of interfaces, separated by 2 newlines and prefixed with indent
//    /// only to use in protocols
//    func str(with interfaces: [InitInterface],
//             usesTabs: Bool = false,
//             tabIndent: Int = 4) -> Str {
//
//        interfaces.map {
//          _indent(usesTabs: usesTabs,
//                  tabIndent: tabIndent) + $0.str
//        }.joined(separator: "\n\n")
//    }
//}
//
//
//
//
//
//public protocol HasFuncInterfacesP: SwiftP {
//
//    var funcInterfaces: [FuncInterface] {get}
//}
//
//public extension HasFuncInterfacesP {
//
//    /// makes a list of props, separated by 2 newlines and prefixed with indent
//    /// only to use in protocols
//    func str(with interfaces: [FuncInterface],
//             usesTabs: Bool = false,
//             tabIndent: Int = 4) -> Str {
//
//        interfaces.map {
//            _indent(usesTabs: usesTabs,
//                    tabIndent: tabIndent) + $0.str
//        }.joined(separator: "\n\n")
//    }
//}

//
//
//
//
//public protocol HasArgsP: SwiftP {
//
//    var properties: [Arg] {get}
//}
//
//public extension HasArgsP {
//
//    /// makes a list of props with { get (set) }
//    /// separated by 2 newlines and prefixed with indent
//    /// used by protocol - to add "var property name: Type {get set}"
//    func strWithGetters(_ properties: [Arg],
//                        andSetters: Bool = false,
//                        usesTabs: Bool = false,
//                        tabIndent: Int = 4) -> Str {
//        properties.map {
//            $0.protocolStr(withSetter: andSetters,
//                           usesTabs: usesTabs,
//                           tabIndent: tabIndent)
//        }.joined(separator: "\n\n")
//    }
//}

