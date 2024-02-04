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
        HStack (alignment: .bottom) {
            VStack (alignment: .leading, spacing: 10) {
                Text(name)
                    .font(.title2)
                    .foregroundStyle(.black)
                HStack {
                    Image("ic-task-type")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                    Text("CT-123")
                        .font(.title3)
                        .foregroundStyle(.black)
                }
            }
            .padding()
            Spacer()
            Image("ic-profile")
                .resizable()
                .frame(width: 20, height: 20)
                .clipShape(Circle())
                .padding()
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .zIndex(2)
    }
}

#Preview {
    TaskView(name: "CT-121", storyPoints: 6)
}
