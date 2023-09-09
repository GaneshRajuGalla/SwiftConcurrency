//
//  GloabalActor.swift
//  SwiftConcurrency
//
//  Created by Ganesh on 09/09/23.
//

import SwiftUI

struct GloabalActor: View {
    
    @StateObject private var viewModel = GlobalActorViewModel()
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack{
                ForEach(viewModel.dataArray, id: \.self) { data in
                    Text("* \(data) * ")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.purple)
                    
                }
            }
            .task {
                await viewModel.getData()
            }
        }
    }
}

struct GloabalActor_Previews: PreviewProvider {
    static var previews: some View {
        GloabalActor()
    }
}
