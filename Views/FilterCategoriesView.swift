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
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}


#Preview {
    @State var vm = LogListViewModel()
    
    return FilterCategoriesView(selectedCategories: $vm.selectedCategories)
}
