//
//  ContentView.swift
//  SwiftUICoreData
//
//  Created by Abhinay Maurya on 23/05/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var managedObjectContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Family.name, ascending: true)],
        animation: .default) private var members: FetchedResults<Family>
    
    @State private var isPresentingFamilyPersonView = false
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(members) { member in
                        HStack(spacing: 10) {
                            Text(member.name ?? "")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            Text(member.relation ?? "")
                                .font(.title3)
                                .fontWeight(.regular)
                        }
                    }
                }
                
                .navigationTitle("Family Members")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isPresentingFamilyPersonView = true
                        }) {
                            Image(systemName: "plus.app")
                                .foregroundColor(.blue)
                        }
                    }
                }
                
                .sheet(isPresented: $isPresentingFamilyPersonView) {
                    FamilyPersonView()
                }
            }
            
            .ignoresSafeArea()
        }
    }
}


#Preview {
    ContentView()
        .environment(\.managedObjectContext, CoreDataHelper.shared.persistentContainer.viewContext)
}
