//
//  FamilyPersonView.swift
//  SwiftUICoreData
//
//  Created by Abhinay Maurya on 23/05/24.
//

import SwiftUI

struct FamilyPersonView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isEmailAlertPresented = false
    @State var personName: String = ""
    @State var relation: String = ""
    
    private let relations = ["Mother", "Father", "Son", "Daughter"]
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack(spacing: 20) {
                    HStack(spacing: 10) {
                        Text("Name:")
                            .foregroundStyle(Color.green)
                        TextField("Enter the family member name",
                                  text: $personName)
                    }
                    
                    Picker("Relation", selection: $relation) {
                        ForEach(relations, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Button("Save") {
                        self.saveFamilyMember()
                    }
                    
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                    .background(.black)
                    .foregroundStyle(Color.white)
                    .clipShape(.buttonBorder)
                    .alert(isPresented: $isEmailAlertPresented,
                           title: "",
                           message: "Please give a name")
                    
                    Spacer()
                }
                .padding()
                .font(.title2)
                
                
                .navigationTitle("Family")
                .navigationBarTitleDisplayMode(.automatic)
            }
        }
    }
    
    func saveFamilyMember() {
        guard !personName.isEmpty else {
            isEmailAlertPresented = true
            return
        }
        
        // Create a new entity object
        let familyEntity = Family(context: managedObjectContext)
        familyEntity.name = personName
        familyEntity.relation = relation
        
        // Save the context
        do {
            try managedObjectContext.save()
            print("Data saved successfully!")
            presentationMode.wrappedValue.dismiss()
        } catch {
            print("Failed to save data: \(error.localizedDescription)")
        }
    }
}

#Preview {
    FamilyPersonView()
}
