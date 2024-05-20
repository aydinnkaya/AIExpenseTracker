//
//  LogListViewModelwift.swift
//  AIExpenseTracker
//
//  Created by Aydın KAYA on 20.05.2024.
//

import Foundation
import Observation



@Observable
class LogListViewModel {
    
    let db = DatabaseManager.shared
    
    var sortType = SortType.date
    var sortOrder = SortOrder.descending
    var selectedCategories = Set<Category>()
    
    var isLogFormPresented = false
    var logToEdit: ExpenseLog?
    
    
}
