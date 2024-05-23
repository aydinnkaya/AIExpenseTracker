//
//  FilterCategoriesView.swift
//  AIExpenseTracker
//
//  Created by Aydın KAYA on 20.05.2024.
//

import SwiftUI

struct FilterCategoriesView: View {
    
    @Binding var selectedCategories: Set<Category>
    private let categories = Category.allCases
    
    var body: some View {
        VStack{
            ScrollView(.horizontal){
                HStack(spacing: 8){
                    ForEach(categories){ category in
                        FilterButtonView(category: category, isSelected: self.selectedCategories.contains(category), onTab: self.onTab)
                        
                    }
                }
                .padding(.horizontal)
            }
            
            if selectedCategories.count > 0{
                Button(role: .destructive){
                    self.selectedCategories.removeAll()
                } label: {
                    Text("Clear all filter selection \(self.selectedCategories.count)")
                }
            }
        }
    }
    
    func onTab(category: Category){
        if selectedCategories.contains(category){
            selectedCategories.remove(category)
        }
        else {
            selectedCategories.insert(category)
        }
    }
}
struct FilterButtonView: View {
    var category: Category
    var isSelected: Bool
    var onTab: (Category) -> ()
    var body: some View {
        HStack(spacing: 4){
            Text(category.rawValue.capitalized)
                .fixedSize(horizontal: true, vertical: true)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 4)
        .background{
            RoundedRectangle(cornerRadius: 16)
                .stroke(isSelected ? category.color:
                            Color.gray, lineWidth: 1)
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(isSelected ? category.color: Color.clear)
                }
        }
        .frame(height: 44)
        .onTapGesture {
            self.onTab(category)
        }
        .foregroundColor(isSelected ? Color.white : nil)
    }
}


#Preview {
    @State var vm = LogListViewModel()
    
    return FilterCategoriesView(selectedCategories: $vm.selectedCategories)
}
