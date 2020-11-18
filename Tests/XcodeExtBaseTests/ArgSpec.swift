import XCTest
import Quick
import Nimble
@testable import XcodeExtBase



class ArgSpec: QuickSpec {
    
    override func spec() {

        describe("Arg") {
            let cmd = TestBaseCMD()

            it("can can be parsed") {
                
                // "str1: Str?"
                expect("a").to(equal("a"))
            }
            
            it("can can be printed") {
                
                // let str = "str1: Str?"
                
                //let arg = Arg(name: <#T##Str#>, type: <#T##TypeName#>)
                expect("a").to(equal("a"))
            }
        }
        
        
        /// _ str1: Str?
        describe("FuncArg") {
            
            it("can can be parsed") {
                
                expect("a").to(equal("a"))
            }
            
            it("can can be printed") {
                
                //let farg = FuncArg(arg: <#T##Arg#>, hasDash: <#T##Bool#>)
                expect("a").to(equal("a"))
            }
        }
    }
}
