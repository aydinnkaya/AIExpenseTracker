//
//  CategoryImageView.swift
//  AIExpenseTracker
//
//  Created by Aydın KAYA on 24.05.2024.
//

import SwiftUI

struct CategoryImageView: View {
    
    let category: Category
    
    var body: some View {
        Image(systemName: category.systemNameIcon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .padding(.all, 8)
            .foregroundColor(category.color)
            .background(category.color.opacity(0.1))
            .cornerRadius(18)
    }
}

#Preview {
    CategoryImageView(category: .utilities)
}
