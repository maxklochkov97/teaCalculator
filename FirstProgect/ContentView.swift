//  ContentView.swift
//  FirstProgect
//
//  Created by Максим Клочков on 20.02.2022.

import SwiftUI

struct ContentView: View {

    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0

    let tipPercentages = [0, 5, 10, 15, 20]

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amounPerPerson = grandTotal / peopleCount

        return amounPerPerson
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Сумма чека:", text: $checkAmount)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }

                Section(header: Text("Сколько чаевых вы хотите оставить?")) {
                    Picker("Выберите процент", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section {
                    Text("\(totalPerPerson, specifier: "%.2f")")
                }

            }
            .navigationTitle("Калькулятор чаевых")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
