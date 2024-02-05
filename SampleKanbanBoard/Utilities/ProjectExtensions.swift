//
//  ProjectExtensions.swift
//  SampleKanbanBoard
//
//  Created by Abdul Karim Khan on 04/02/2024.
//

import SwiftUI

extension Color {
    static var random: Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1))
    }
}
