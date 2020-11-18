import XCTest
import Quick
import Nimble
@testable import XcodeExtBase



class PropertySpec: QuickSpec {
    override func spec() {

        describe("PropertyCMD") {
            let cmd = TestBaseCMD()

            it("can can be parsed") {
                
                /// (public) var cat: Cat
                expect("a").to(equal("a"))
            }
            
            it("can can be printed") {
                
                // let str = (public) var cat: Cat
                //let prop = Property(<#T##nameTypePair: Arg##Arg#>, <#T##access: AccessMod?##AccessMod?#>)
                expect("a").to(equal("a"))
            }
        }
        
// describe("Property") {

    }
}
