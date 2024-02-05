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
    @Binding var theColorScheme: ColorScheme

    var body: some View {
        ZStack {
            Color.gray.opacity(0.45).ignoresSafeArea()
            VStack (alignment: .leading) {
                Text(name)
                    .font(.title)
                    .bold()
                    .foregroundStyle((theColorScheme == .dark) ? .white : .black)
                    .padding()
                VStack (spacing: 10) {
                    List(tasks, id: \.self) { task in
                        TaskView(name: task.name, storyPoints: task.storypoints)
                            .draggable(task)
                            .listRowBackground(Color.clear)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .scrollIndicators(.hidden)
                    .background(.clear)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
        }
        .frame(height: 500)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

