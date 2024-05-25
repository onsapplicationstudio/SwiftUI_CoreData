//
//  View+Alert.swift
//  SwiftUICoreData
//
//  Created by Abhinay Maurya on 25/05/24.
//

import SwiftUI

extension View {
    func alert(isPresented: Binding<Bool>,
               title: String,
               message: String,
               buttonText: String = "OK",
               action: @escaping () -> Void = {}) -> some View {
        alert(title,
              isPresented: isPresented) {
            Button(buttonText,
                   action: action)
        } message: {
            Text(message)
        }
    }
    
    func alertWithOkAndCancel(isPresented: Binding<Bool>,
                              title: String,
                              message: String,
                              buttonText: String = "OK",
                              cancelButtonText: String = "Cancel",
                              action: @escaping (Bool) -> Void) -> some View {
        alert(title,
              isPresented: isPresented) {
            Button(buttonText) {
                action(true)
            }
            Button(cancelButtonText) {
                action(false)
            }
        } message: {
            Text(message)
        }
    }
}
