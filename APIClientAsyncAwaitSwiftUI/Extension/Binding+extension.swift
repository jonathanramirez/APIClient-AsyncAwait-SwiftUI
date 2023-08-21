//
//  Binding+extension.swift
//  APIClientAsyncAwaitSwiftUI
//
//  Created by Jonathan on 21.08.23.
//

import SwiftUI

extension Binding {

    func optinal<T>(defaultValue: T) -> Binding<T> where Value == T? {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
