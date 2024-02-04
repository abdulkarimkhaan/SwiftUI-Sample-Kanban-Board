//
//  ContentView.swift
//  SampleKanbanBoard
//
//  Created by Abdul Karim Khan on 03/02/2024.
//

import SwiftUI

struct SampleKanban: View {
    
    @State var progress = [
        ProgressStatus(name: "ToDo", tasks: [Task(name: "Task A", storypoints: 6, status: .ToDo)], status: .ToDo),
        ProgressStatus(name: "InProgress", tasks: [Task(name: "Task B", storypoints: 3, status: .InProgress), Task(name: "Task C", storypoints: 4, status: .InProgress)], status: .InProgress),
        ProgressStatus(name: "Done", tasks: [Task(name: "Task D", storypoints: 4, status: .Done)], status: .Done)
    ]
    
    @State var draggingTask: Task?

    var body: some View {
        VStack {
            Spacer()
            Text("SwiftUI Sample Kanban Board")
                .font(.system(size: 40))
            HStack {
                ForEach($progress, id: \.self) { $progressStatus in
                    StatusColumn(name: progressStatus.name, tasks: progressStatus.tasks)
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
//                            if let draggingTask, status {
//                                if let sourceIndex = progressStatus.tasks.firstIndex(of: draggingTask), let destinationIndex = progressStatus.tasks.firstIndex(of: task) {
//                                    withAnimation(.bouncy) {
//                                        let sourceTask = progressStatus.tasks.remove(at: sourceIndex)
//                                        progressStatus.tasks.insert(sourceTask, at: destinationIndex)
//                                    }
//                                }
//                            }
                        }
                }
            }
            .padding()
            Spacer()
        }
        .frame(width: 900)
    }
}

#Preview {
    SampleKanban()
}
