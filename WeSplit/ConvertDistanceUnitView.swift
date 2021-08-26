//
//  ConvertDistanceUnitView.swift
//  WeSplit
//
//  Created by 望月紀生 on 2021/08/27.
//

import SwiftUI

struct ConvertDistanceUnitView {
    @State private var inputDistance = ""
    @State private var selectedInputUnit = 1
    @State private var selectedOudputUnit = 2
    let inputUnit = ["m", "km", "feet", "yard", "mile"]
    let outputUnit = ["m", "km", "feet", "yard", "mile"]
}

extension ConvertDistanceUnitView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Distance")) {
                    TextField("Please input the distance", text: $inputDistance)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Input Unit")) {
                    Picker("Input Unit", selection: $selectedInputUnit) {
                        ForEach(0 ..< inputUnit.count ) {
                            Text("\(inputUnit[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output Unit")) {
                    Picker("Output Unit", selection: $selectedOudputUnit) {
                        ForEach(0 ..< outputUnit.count) {
                            Text("\(outputUnit[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Result")) {
                    Text("")
                }
            }
            .navigationTitle("Convert Distance Unit")
        }
    }
}

struct ConvertDistanceUnitView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertDistanceUnitView()
    }
}
