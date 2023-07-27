//
//  Pairing.swift
//  HomeSet
//
//  Created by una ivan on 18/07/23.
//

import SwiftUI
import SwiftUICharts

struct ComponentListView: View {
    @StateObject private var dataViewModel = DataViewModel()
    @State private var selectedComponent: Component? = nil
    
    var body: some View {
        NavigationView {
//            if dataViewModel.components.isEmpty {
//                ProgressView()
//                    .onAppear(perform: dataViewModel.fetchData)
//            } else {
            List(dataViewModel.components, id: \.id) { component in
                                if let roomName = dataViewModel.roomName(for: component) {
                                    ComponentRowView(component: component, roomName: roomName)
                                }
                            }

                .listStyle(.plain)
                .frame(width: UIScreen.main.bounds.width - 40)
                .padding(.trailing, 20)
                .padding(.leading, 10)
                .frame(height: .infinity)
//            }
        }
    }
}


struct ComponentRowView: View {
    @State private var isComponentActive: Bool
    @State private var selectedComponent: Component? = nil
    
    let component: Component
    let roomName: String
    
    init(component: Component, roomName: String) {
        self.component = component
        self.roomName = roomName
        _isComponentActive = State(initialValue: component.componentstatus)
    }
    
    var body: some View {
        Button(action: {
            selectedComponent = component
        }) {
            HStack(alignment: .center, spacing:10){
                Image(systemName: component.componenticon)
                    .frame(width:46, height:46)
                    .cornerRadius(10)
                    .foregroundColor(Color.gray)
                    .font(.system(size: 24))
                
                VStack(alignment: .leading, spacing: 5){
                    Text(roomName)
                        .font(.system(size: 12))
                        .foregroundColor(Color.pink)
                    Text(component.componentname)
                        .font(.system(size: 15))
                        .foregroundColor(Color.black)
                    Text(component.componenttype)
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Toggle("", isOn: $isComponentActive)
                    .labelsHidden()
                
            }
        }
        .sheet(item: $selectedComponent) { component in
            ComponentDetailView(component: component)
        }
    }
}

struct ComponentDetailView: View {
    let dataPoints: [Double] = [3, 2.2, 2.8, 2, 1.5, 1.9, 0.5]
        let dataPointLabels = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    
    let component: Component
    
    var body: some View {
        VStack {
            
            HStack(alignment: .center, spacing:10){
                Image(systemName: component.componenticon)
                    .frame(width:46, height:46)
                    .cornerRadius(10)
                    .foregroundColor(Color.gray)
                    .font(.system(size: 24))
                
                VStack(alignment: .leading, spacing: 5){

                    Text(component.componentname)
                        .font(.system(size: 15))
                        .foregroundColor(Color.black)
                    Text(component.componenttype)
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray)
                }.frame(maxWidth: .infinity, alignment: .leading)
            }.padding(EdgeInsets(top: 30, leading: 40, bottom: 0, trailing: 20))
            
            
//            Image(systemName: component.componenticon)
//                .frame(width:92, height:92)
//                .cornerRadius(10)
//                .foregroundColor(Color.gray)
//                .font(.system(size: 78))
//
//            Text(component.componentname)
//                .font(.title)
//
//            Text(component.componenttype)
//                .font(.subheadline)
//
//            Text("Status: \(component.componentstatus ? "Active" : "Inactive")")
//                .font(.subheadline)

            BarChart(dataPoints: dataPoints, dataPointLabels: dataPointLabels).frame(maxWidth: .infinity, alignment: .center)

            HStack{
                Button {
                } label: {
                    Text("Unpair")
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 16))
                        .padding(.bottom, 2)
                        .padding(.top, 2)
                        .bold()
                        .background(Color.white)
                        .foregroundColor(.pink)
                }
            }
            
        }
        .presentationDetents([.height(300)])
    }
}


struct BarChart: View {
    let dataPoints: [Double]
    let dataPointLabels: [String]

    var body: some View {
        VStack {
            HStack(alignment: .bottom, spacing: 8) {
                ForEach(0..<dataPoints.count, id: \.self) { index in
                    VStack {
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 30, height: CGFloat(dataPoints[index] * 50))
                        Text(dataPointLabels[index])
                            .font(.caption)
                    }
                }
            }
            .padding(.bottom, 16)
        }
    }
}
