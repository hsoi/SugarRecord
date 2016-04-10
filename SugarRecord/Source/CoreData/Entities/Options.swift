import Foundation
import CoreData

public extension CoreData {

    public enum Options {
        case Default
        case Migration
        case NoMigrationJournalMode(JournalMode)
        case MigrationJournalMode(JournalMode)
    
        func dict() -> [NSObject: AnyObject] {
            switch self {
            case .Default:
                var sqliteOptions: [String: String] = [String: String] ()
                sqliteOptions["journal_mode"] = JournalMode.WAL.rawValue
                var options: [NSObject: AnyObject] = [NSObject: AnyObject] ()
                options[NSMigratePersistentStoresAutomaticallyOption] = NSNumber(bool: true)
                options[NSInferMappingModelAutomaticallyOption] = NSNumber(bool: false)
                options[NSSQLitePragmasOption] = sqliteOptions
                return options
            case .Migration:
                var sqliteOptions: [String: String] = [String: String] ()
                sqliteOptions["journal_mode"] = JournalMode.WAL.rawValue
                var options: [NSObject: AnyObject] = [NSObject: AnyObject] ()
                options[NSMigratePersistentStoresAutomaticallyOption] = NSNumber(bool: true)
                options[NSInferMappingModelAutomaticallyOption] = NSNumber(bool: true)
                options[NSSQLitePragmasOption] = sqliteOptions
                return options
            case .NoMigrationJournalMode(let journalMode):
                var sqliteOptions: [String: String] = [String: String] ()
                sqliteOptions["journal_mode"] = journalMode.rawValue
                var options: [NSObject: AnyObject] = [NSObject: AnyObject] ()
                options[NSMigratePersistentStoresAutomaticallyOption] = NSNumber(bool: true)
                options[NSInferMappingModelAutomaticallyOption] = NSNumber(bool: false)
                options[NSSQLitePragmasOption] = sqliteOptions
                return options
            case .MigrationJournalMode(let journalMode):
                var sqliteOptions: [String: String] = [String: String] ()
                sqliteOptions["journal_mode"] = journalMode.rawValue
                var options: [NSObject: AnyObject] = [NSObject: AnyObject] ()
                options[NSMigratePersistentStoresAutomaticallyOption] = NSNumber(bool: true)
                options[NSInferMappingModelAutomaticallyOption] = NSNumber(bool: true)
                options[NSSQLitePragmasOption] = sqliteOptions
                return options
            }
        }
        
    }
}
