import XCTest
import Quick
import Nimble
@testable import XcodeExtBase


final class TestEnumCMD: NSObject, EnumCMDP {}


class EnumSpec: QuickSpec {
    override func spec() {
        
        describe("Enum") {
            let cmd = TestEnumCMD()

            it("can can be parsed") {
                
                let line = "" // (public) enum Animal { case cat, dog}
                
//                guard let type1 = cmd.parseCases(from:line)?.first else {
//                    XCTFail()
//                    return
//                }
                //expect(type1.type).to(equal(SwiftType._enum))
                
                // (public) enum Animal { case cat = "cat"}
                //expect("a").to(equal("a"))
                
                // (public) enum Animal { case cat(Cat)}
                // expect("a").to(equal("a"))
            }
          
            
            it("can can be printed") {
                
//                 let str1 = ""//(public) enum Animal { case cat, dog}
//                let enum1 = TypeDecl(type: ._enum, name: "cat", props: [], access: nil)
//
//
//                 let str2 = ""//(public) enum Animal { case cat = "cat"}
//                let enum2 = TypeDecl(type: ._enum, name: "cat", props: <#T##[Property]#>, access: nil)
//
//                 let str3 = ""//(public) enum Animal { case cat(Cat)}
//                let enum3 = TypeDecl(type: ._enum, name: "cat", props: [], access: nil)
//
//                expect("a").to(equal("a"))
            }
            
//            it("can supports AccessMods") {
//                
//                let publicStr = ""//(public) enum Animal { case cat, dog}
//                let publicEnum = TypeDecl(type: ._enum, name: "cat", props: [], access: AccessMod._public)
//                
//                
//                let privateStr = ""//(public) enum Animal { case cat, dog}
//                let privateEnum = TypeDecl(type: ._enum, name: "cat", props: [], access: AccessMod._public)
//            }
            
            // properties are not supported ?
        }
        
        // describe("Enum") {
        
    }
}
