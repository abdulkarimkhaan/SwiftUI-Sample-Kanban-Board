//
//  ContentView.swift
//  SampleKanbanBoard
//
//  Created by Abdul Karim Khan on 03/02/2024.
//

import SwiftUI

struct SampleKanban: View {
    
    @State var progress = [
        ProgressStatus(name: "To Do", tasks: [Task(name: "Implement Customer's Feedback on Refferal Program", storypoints: 6, status: .ToDo)], status: .ToDo),
        ProgressStatus(name: "In Progress", tasks: [Task(name: "Add Payment Gateways Option", storypoints: 3, status: .InProgress), Task(name: "Update Data", storypoints: 4, status: .InProgress)], status: .InProgress),
        ProgressStatus(name: "Done", tasks: [Task(name: "Enhance UI/UX", storypoints: 4, status: .Done)], status: .Done)
    ]
    
    @State var draggingTask: Task?
    @State var theColorScheme: ColorScheme = .dark

    var body: some View {
        VStack {
            Spacer()
            Text("SwiftUI Sample Kanban Board")
                .foregroundStyle((theColorScheme == .dark) ? .white : .black)
                .font(.system(size: 40))
                .bold()
            HStack {
                ForEach($progress, id: \.self) { $progressStatus in
                    StatusColumn(name: progressStatus.name, tasks: progressStatus.tasks, theColorScheme: $theColorScheme)
                        .dropDestination(for: Task.self) { droppedTasks, location in
                            draggingTask = droppedTasks.first
                            var temp: [ProgressStatus] = []
                            
                            for var progress in progress {
                                if progress.status != progressStatus.status {
                                    progress.tasks.removeAll {$0 == droppedTasks.first}
                                } else {
                                    if var dropTask = droppedTasks.first, dropTask.status != progressStatus.status {
                                        dropTask.status = progressStatus.status
                                        progress.tasks.append(dropTask)
                                    }
                                }
                                temp.append(progress)
                            }
                            
                            progress = temp
                            
                            return true
                        } isTargeted: { status in
                            print("We are hovering at \(progressStatus.tasks)")
                        }
                }
            }
            .padding()
            Spacer()
            HStack {
                Button(action: self.toggleColorScheme) {
                    Text((theColorScheme == .dark) ? "Enable Light Mode" : "Enable Dark Mode")
                        .font(.title3)
                }
                .padding()
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                Spacer()
                Text("ABDUL KARIM KHAN")
                    .foregroundStyle((theColorScheme == .dark) ? .white : .black)
                    .font(.system(size: 16))
                    .bold()
                    .padding()
            }
        }
        .frame(width: 900)
        .background((theColorScheme == .dark) ? .black : .white)
    }
    
    func toggleColorScheme() {
        theColorScheme = (theColorScheme == .dark) ? .light : .dark
    }
}

#Preview {
    SampleKanban()
}
