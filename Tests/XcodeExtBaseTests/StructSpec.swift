import XCTest
import Quick
import Nimble
@testable import XcodeExtBase


final class TestStructCMD: NSObject, TypeCMDP {}


class StructSpec: QuickSpec {
    
    override func spec() {

        describe("Struct") {
            let cmd = TestStructCMD()

            it("can can be parsed") {
                
                let str = "" // (public) wtruct Animal { var name: Str }
                
                guard let type = cmd.parseTypeDecl(str.lines!) else {
                    XCTFail()
                    return
                }
                //expect(type.type).to(equal(._struct))
            }
            
            it("can can be printed") {
                
                // let str =
                
                //let en = TypeDecl(type: <#T##SwiftType#>, name: <#T##Str#>, props: <#T##[Property]#>, access: <#T##AccessMod?#>)
                expect("a").to(equal("a"))
            }
            
            it("can supports AccessMods") {
                
//                let publicStr = "" //public) class Animal { var name: Str }
//                let publicStruct = TypeDecl(._struct, name: "cat", props: [], ._public)
//                
//                let privateStr = "" //public) class Animal { var name: Str }
//                let privateStruct = TypeDecl(._struct, name: "cat", props: [], ._public)
            }
        }
        
        // describe("Enum") {
        
    }
}
