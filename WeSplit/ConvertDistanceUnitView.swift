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
    let fromInputToMeter = ["m": 1.0, "km": 1000.0, "feet": 0.3048, "yard": 0.9144, "mile": 1609.34]
    let fromMeterToOutputUnit = ["m": 1.0, "km": 0.001, "feet": 3.28084, "yard": 1.093613, "mile": 0.0006214]
    
    var result: Double {
        let input = Double(inputDistance) ?? 0.0
        let inputUnit = inputUnit[selectedInputUnit]
        let distance = input * fromInputToMeter[inputUnit]!
        
        let outputUnit = outputUnit[selectedOudputUnit]
        return distance * fromMeterToOutputUnit[outputUnit]!
    }
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
                    Text("\(result)")
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
