import Foundation
import SwiftData

@Model
class Data: Identifiable {
    
    // We need to define the "id" variable when using the Identifiable protocol.
    var id: String
    var name: String
    
    init(name: String) {
    
    // This line assigns a unique UUID (Universally Unique Identifier) to the id property.
        self.id = UUID().uuidString
        self.name = name
    }
    
}
