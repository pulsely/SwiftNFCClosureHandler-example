//
//  ContentView.swift
//  NFCReader
//
//  Created by Pulsely on 6/12/23.
//

import SwiftUI
import SwiftNFCClosureHandler

struct ContentView: View {
    @StateObject var nfc: SwiftNFCClosureHandler = SwiftNFCClosureHandler()
    
    @State var nfc_value:String = "Standing by..."
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .padding(.bottom, 40)
            Text(nfc_value)
                .padding(.bottom, 40)

            Button(action: {
                nfc.begin(action: { data in
                    
                    if let string = String(data: data, encoding: .ascii) {
                        self.nfc_value = string
                    }
                })
            }) {
                Text("Click to Scan")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
