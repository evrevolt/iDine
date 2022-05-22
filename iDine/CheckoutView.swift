//
//  CheckoutView.swift
//  iDine
//
//  Created by Геннадий Ведерников on 22.05.2022.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    let typAmounts = [10, 15, 20, 25, 0]
    let pickupTimes = ["Now", "Toning", "Tomorow"]
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    @State private var paymentType = "Cash"
    @State private var addLoyalityDetails = false
    @State private var loyalityNumber = ""
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false
    @State private var pickupTime = "Now"
    
    var body: some View {
        Form {
            
            Section{
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add iDini loyality card", isOn: $addLoyalityDetails.animation())
                if addLoyalityDetails {
                TextField("Enter your iDini ID", text: $loyalityNumber)
                }
            }
            
            Section(header: Text("When to deliver your order?")) {
                Picker("Time", selection: $pickupTime) {
                    ForEach(pickupTimes, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage", selection: $tipAmount) {
                    ForEach(typAmounts, id: \.self){
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section(header:
                        Text("Total: \(totalPrice)")
                .font(.largeTitle)
            ) {
                Button("Confirm Order") {
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confimed"), message: Text("Your total was \(totalPrice). \n Your order will be delivered \(pickupTime). \n Thank you!"), dismissButton: .default(Text("OK")))
        }.animation(.default, value: 1)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
