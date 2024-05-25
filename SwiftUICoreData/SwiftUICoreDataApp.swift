//
//  SwiftUICoreDataApp.swift
//  SwiftUICoreData
//
//  Created by Abhinay Maurya on 23/05/24.
//

import SwiftUI

@main
struct SwiftUICoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                              CoreDataHelper.shared.persistentContainer.viewContext)
        }
    }
}
