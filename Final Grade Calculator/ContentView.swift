//
//  ContentView.swift
//  Final Grade Calculator
//
//  Created by Faiz Ali on 9/27/22.
//
//Add some comments here
import SwiftUI



struct ContentView: View {
    @State var currentGradeTextField = ""
    @State var finalWeightTextField = ""
    @State var desiredGrade = 0.0
    @State var requiredGrade = 0.0
    var body: some View {
        VStack{
            
             Text("Final Grade Calculator")
                .font(.title)
            .fontWeight(.bold)
            
            TextField("Current Semester Grade", text: $currentGradeTextField)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .frame(width:200, height: 30, alignment: .center)
                .font(.body)
                .padding()
            TextField("Final Weight %", text: $finalWeightTextField)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .frame(width:200, height: 30, alignment: .center)
                .font(.body)
                .padding()
            Picker("Desired Semester Grade", selection: $desiredGrade) {
                Text("A").tag(90.0)
                Text("B").tag(80.0)
                Text("C").tag(70.0)
                Text("D").tag(60.0)
                //Text("Required Grade on Final")
                   // .font(.title)
                
                
            }
            
            .pickerStyle(SegmentedPickerStyle())
           
            Text("Required Grade on Final")
                .font(.title)
            Text(String(round(requiredGrade * 100) / 100.0))
           
            .padding()
            Spacer()
            
        }
        .onChange(of: desiredGrade, perform: { newValue in calculateGrade()
        })
        .background(requiredGrade > 100 ? Color.red : Color.green.opacity(requiredGrade > 0 ? 1.0 : 0.0))
        
    }
    func calculateGrade() {
        // if there is a number there
        if let currentGrade = Double(currentGradeTextField) {
            // if there is a number there
            if let finalWeight = Double(finalWeightTextField) {
                // check that final weight is valid
                if finalWeight < 100 && finalWeight > 0 {
                    // turn weight into a percentage
                    let finalPercentage = finalWeight / 100.0
                    // do the math (and make sure the result is not less than zero)
                    requiredGrade = max(0.0,(desiredGrade - (currentGrade * (1.0 - finalPercentage))) / finalPercentage)
                }
            }
        }
    }
    
    
    //.onChange(of: desiredGrade, perform: { newValue in calculateGrade()
    //})
    //.background(requiredGrade > 100 ? Color.red : Color.green.opacity(requiredGrade > 0 ? 1.0 : 0.0))
    
    // .padding()
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
//    struct CustomTextfield: View {
//        let text : String1
//    }
    
    
}

