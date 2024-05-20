//
//  DatabaseManager.swift
//  AIExpenseTracker
//
//  Created by Aydın KAYA on 20.05.2024.
//

import FirebaseFirestore
import Foundation

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private init() {}
    
    private (set) lazy var logsCollection: CollectionReference = {
        Firestore.firestore().collection("logs")
    }()
    
    func add(log: ExpenseLog) throws {
        try logsCollection.document(log.id).setData(from: log)
    }
    
    func update(log: ExpenseLog) {
        logsCollection.document(log.id).updateData([
            "name": log.name,
            "amount": log.amount,
            "category": log.category,
            "date": log.date
        ])
    }
    
    func delete(log: ExpenseLog) {
        logsCollection.document(log.id).delete()
    }
    
}
