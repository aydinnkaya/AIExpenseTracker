//
//  SelectSortOrderView.swift
//  AIExpenseTracker
//
//  Created by Aydın KAYA on 24.05.2024.
//

import SwiftUI

struct SelectSortOrderView: View {
    @Environment(\.horizontalSizeClass) var
    horizontalSizeClass
    
    @Binding var sortType: SortType
    @Binding var sortOrder: SortOrder
    
    private let sortTypes = SortType.allCases
    private let sortOrders = SortOrder.allCases
    
    
    var body: some View {
        HStack{
            #if !os(macOS)
            Text("Sort By")
            #endif
            
            Picker(selection: $sortType) {
                ForEach(sortTypes){ type in
                    if horizontalSizeClass == .compact{
                        Image(systemName: type.systemNameIcon)
                            .tag(type)
                    }else{
                        Text(type.rawValue.capitalized)
                            .tag(type)
                    }
                    
                }
            } label: {
                Text("Sort By")
            }
            .pickerStyle(SegmentedPickerStyle())
            
            #if !os(macOS)
            Text("Order By")
            #endif
            
            Picker(selection: $sortOrder, label: Text("Order By")) {
                ForEach(sortOrders) { order in
                    if horizontalSizeClass == .compact {
                        Image(systemName: order == .ascending ? "arrow.up" : "arrow.down").tag(order)
                    } else {
                        Text(order.rawValue.capitalized)
                            .tag(order)
                    }
                }
            }.pickerStyle(SegmentedPickerStyle())
            
        }
        .padding()
        .frame(height: 64)
    }
    
    
    
}


#Preview {
    @State var vm = LogListViewModel()
    return SelectSortOrderView(sortType: $vm.sortType, sortOrder: $vm.sortOrder)
}
