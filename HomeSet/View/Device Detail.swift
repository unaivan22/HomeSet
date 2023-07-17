//
//  Device Detail.swift
//  HomeSet
//
//  Created by una ivan on 17/07/23.
//

import SwiftUI

struct DeviceDetail : View {
    @State private var showingCredits = false

        var body: some View {
            Button("Show Credits") {
                showingCredits.toggle()
            }
            .sheet(isPresented: $showingCredits) {
                Text("This app was brought to you by Hacking with Swift")
//                    .presentationDetents([.medium, .large])
                    .presentationDetents([.height(150)])
            }
        }
}


