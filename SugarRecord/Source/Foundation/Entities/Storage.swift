import Foundation

public enum StorageType {
    case CoreData
    case Realm
}

public protocol Storage: CustomStringConvertible, Requestable {
        
    var type: StorageType { get }
    var mainContext: Context! { get }
    var saveContext: Context! { get }
    var memoryContext: Context! { get }
    func removeStore() throws
    func operation(operation: (context: Context, save: () -> Void) throws -> Void) throws
    func fetch<T: Entity>(request: Request<T>) throws -> [T]
    func fetch<T: Entity>(request: Request<T>, postFetchSort: [NSSortDescriptor]) throws -> [T]
    
}

// MARK: - Storage extension (Fetching)

public extension Storage {

    func fetch<T: Entity>(request: Request<T>) throws -> [T] {
        return try self.mainContext.fetch(request)
    }

    func fetch<T: Entity>(request: Request<T>, postFetchSort: [NSSortDescriptor]) throws -> [T] {
        return try self.mainContext.fetch(request, postFetchSort: postFetchSort)
    }

}
