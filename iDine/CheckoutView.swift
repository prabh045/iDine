//
//  CheckoutView.swift
//  iDine
//
//  Created by Prabhdeep Singh on 18/01/21.
//  Copyright © 2021 Phoenix. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    @State private var pickUpTime = 0
    
    let tipAmounts = [10, 15, 20, 25, 0]
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let pickupTimes = ["Now", "Tonight", "Tomorrow Morning"]
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tip = (Double(self.tipAmounts[tipAmount]) / 100 ) * total
        return total + tip
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add iDine Loyality card")
                }
                
                if addLoyaltyDetails {
                    TextField("Enter Your iDine ID", text: $loyaltyNumber)
                }
            }
            
            Section {
                Picker("Tip", selection: $tipAmount) {
                    ForEach(0..<self.tipAmounts.count) {
                        Text("\(self.tipAmounts[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Pick Up Time")) {
                Picker(selection: $pickUpTime, label: Text("yolo")) {
                    ForEach(0..<Self.pickupTimes.count) {
                        Text(Self.pickupTimes[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header:
                Text("TOTAL: $\(totalPrice, specifier: "%.2f")")
                    .font(.largeTitle)
            ) {
                Button("Confirm order") {
                    self.showingPaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order Confirmed"), message: Text("Your Total Was $\(totalPrice, specifier: "%.2f"). Many Thanks!! :)"), dismissButton: .default(Text("Okay")))
        }
    }
    
    struct CheckoutView_Previews: PreviewProvider {
        static let order = Order()
        static var previews: some View {
            CheckoutView().environmentObject(order)
        }
    }
}
