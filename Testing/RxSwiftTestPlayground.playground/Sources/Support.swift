import Foundation
 
public func example(_ rxOperator: String, _ action: () -> ()) {
    print("\n--- Example of:", rxOperator, "---")
    action()
}
