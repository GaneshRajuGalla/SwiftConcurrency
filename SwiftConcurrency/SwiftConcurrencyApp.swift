//
//  SwiftConcurrencyApp.swift
//  SwiftConcurrency
//
//  Created by Ganesh on 27/08/23.
//

import SwiftUI

@main
struct SwiftConcurrencyApp: App {
    var body: some Scene {
        WindowGroup {
            DoCatchTryThrowView(manager: DoCatchTryThrowDataManager())
        }
    }
}
