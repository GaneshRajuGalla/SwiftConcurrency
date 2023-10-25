//
//  AsyncPublisherView.swift
//  SwiftConcurrency
//
//  Created by Ganesh on 25/10/23.
//

import SwiftUI

struct AsyncPublisherView: View {
    
    // MARK: - Properties
    @StateObject private var viewModel = AsyncPublisherViewModel()

    // MARK: - Body
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                ForEach(viewModel.dataArray, id: \.self) {
                    Text($0)
                        .font(.headline)
                        .fontWeight(.bold)
                }
            }
        }
        .task {
            await viewModel.start()
        }
    }
}

struct AsyncPublisherView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncPublisherView()
    }
}
