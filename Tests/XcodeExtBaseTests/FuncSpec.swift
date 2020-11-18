import XCTest
import Quick
import Nimble
@testable import XcodeExtBase


final class TestBaseCMD: NSObject, XCCMDP {}


class FuncSpec: QuickSpec {
    override func spec() {

        describe("FuncInterface") {
            let cmd = TestBaseCMD()

            it("can can be parsed") {
                
                let str1 = "" // func print(_ str1: Str?, _ str2: Str?) -> Str?
                
                guard let type1 = cmd.parseFuncInterface(str1) else {
                    XCTFail()
                    return
                }
                //expect(type1.type).to(equal(SwiftType._enum))
                
                ///
                expect("a").to(equal("a"))
            }
            
            it("can can be printed") {
                
                // let str =
                
                //let f = Func(name: <#T##Str#>, args: <#T##[FuncArg]#>, returnType: <#T##TypeDecl?#>, access: <#T##AccessMod?#>)
                expect("a").to(equal("a"))
            }
        }
        
//        describe("FuncDecl") {}
        
// describe("Func") {

    }
}
