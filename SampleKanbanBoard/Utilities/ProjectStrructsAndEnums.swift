//
//  ProjectStrructsAndEnums.swift
//  SampleKanbanBoard
//
//  Created by Abdul Karim Khan on 03/02/2024.
//

import SwiftUI

enum Progress: Codable {
    case ToDo
    case InProgress
    case Done
}

struct ProgressStatus: Hashable {
    var name: String
    var tasks: [Task]
    var status: Progress
}

struct Task: Hashable, Transferable, Codable {
    var name: String
    var storypoints: Int
    var status: Progress
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .vCard)
    }
}


