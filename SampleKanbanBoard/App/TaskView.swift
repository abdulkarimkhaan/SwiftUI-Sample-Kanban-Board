//
//  TaskView.swift
//  SampleKanbanBoard
//
//  Created by Abdul Karim Khan on 03/02/2024.
//

import SwiftUI

struct TaskView: View {
    
    @State var name: String
    @State var storyPoints: Int
    
    var body: some View {
        VStack {
            Text(name)
                .font(.title)
                .padding(.top)
            Text("Story Points - \(storyPoints)")
                .font(.title2)
                .padding()
        }
        .frame(maxWidth: .infinity)
        .background(.gray)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .zIndex(2)
    }
}

