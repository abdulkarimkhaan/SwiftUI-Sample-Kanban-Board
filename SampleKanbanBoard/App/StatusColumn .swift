//
//  StatusColumn .swift
//  SampleKanbanBoard
//
//  Created by Abdul Karim Khan on 03/02/2024.
//

import SwiftUI

struct StatusColumn: View {
    
    @State var name: String
    @State var tasks: [Task]
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(name)
                .font(.title)
                .bold()
                .foregroundStyle(.white)
            ZStack {
                Color.white.ignoresSafeArea()
                VStack (spacing: 10) {
                    List(tasks, id: \.self) { task in
                        TaskView(name: task.name, storyPoints: task.storypoints)
                            .draggable(task)
                            .listRowBackground(Color.clear)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .background(.clear)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
        }
        .frame(height: 500)
    }
}

