import XCTest
import Quick
import Nimble
@testable import XcodeExtBase


final class TestClassCMD: NSObject, TypeCMDP {}


class ClassSpec: QuickSpec {
    override func spec() {
        
        describe("Class") {
            let cmd = TestClassCMD()

            it("can can be parsed") {
                
                let str1 = "public class Animal { var name: Str }"
                
                guard let type1 = cmd.parseTypeDecl(str1.lines!) else {
                    XCTFail()
                    return
                }
                //expect(type1.type).to(equal(._class))
            }
            
            it("can can be printed") {
                
                let str = "public class Animal { }"

//                let clas = TypeDecl(._class, name: "Animal", props: [])
//                expect(clas.str()).to(equal(str))
            }
            
            it("can supports properties") {
                
                let str = "public class Animal { var name: Str }"
                
                // let str =
                //let prop = Property(name: "name", type: "Str", access: nil, optional: false)
//                let clas = TypeDecl(._class, name: "Animal", props: [])
//                expect(clas.str()).to(equal(str))
            }
        }
        
        // describe("Enum") {
        
    }
}
