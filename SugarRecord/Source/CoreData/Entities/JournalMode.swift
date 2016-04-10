import Foundation
import CoreData

public extension CoreData {
    
    public enum JournalMode: String {
        case Delete         =   "DELETE"
        case Truncate       =   "TRUNCATE"
        case Persist        =   "PERSIST"
        case Memory         =   "MEMORY"
        case WAL            =   "WAL"
        case Off            =   "OFF"
    }

}
