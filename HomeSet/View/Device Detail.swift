//
//  Device Detail.swift
//  HomeSet
//
//  Created by una ivan on 17/07/23.
//

import SwiftUI

struct DeviceDetail : View {
    let component: Component
        
        var body: some View {
            VStack {
                Text(component.componentname)
                    .font(.title)
                Text(component.componenttype)
                    .font(.subheadline)
                Text("Status: \(component.componentstatus ? "Active" : "Inactive")")
                    .font(.subheadline)
            }
        }
}



struct ShowDetail : View {
    let component: Component
    @State private var showingCredits = false

        var body: some View {
            Button("Show Credits") {
                showingCredits.toggle()
            }
            .sheet(isPresented: $showingCredits) {
                VStack {
                    Text(component.componentname)
                        .font(.title)
                    Text(component.componenttype)
                        .font(.subheadline)
                    Text("Status: \(component.componentstatus ? "Active" : "Inactive")")
                        .font(.subheadline)
                }
                    .presentationDetents([.height(150)])
            }
        }
}


