//
//  ReviewMovieView.swift
//  Vasflix
//
//  Created by Adrian Castañeda on 23/04/24.
//

import SwiftUI

struct ReviewMovieView: View {
    @State var isFavorite = false
    
    var getButtonAction = ButtonActions()
    var body: some View {
        
        VStack(alignment: .leading,spacing: 10) {
            ZStack {
                Rectangle()
                    .frame(height: 300)
            }
            VStack(alignment: .leading,spacing: 10) {
                Text("The Conjuring")
                    .font(.title)
                    .foregroundStyle(.white)
                Text("Jun 27 2018")
                    .font(.caption)
                    .foregroundStyle(.white).opacity(0.60)
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                    Text("( 1.2M )")
                        .font(.caption)
                        .foregroundStyle(.white)
                    
                    Button {
                        getButtonAction.valideFavoriteButton(isFavorite: isFavorite)
                    }label: {
                        Image(systemName: "heart.fill")
                            .foregroundStyle(isFavorite ? .red : .gray)
                    }
                    
                }
                HStack {
                    ForEach(0..<3) { genre in
                        Text("Action")
                            .font(.caption)
                            .foregroundStyle(.white)
                            .padding(.horizontal,15)
                            .padding(.vertical,7)
                            .border(.ultraThinMaterial,width: 2)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .background(.navy)
                            
                    }
                }
                Text("Description")
                    .font(.headline)
                    .foregroundStyle(.white)
                Text("Lorem ipsum dolor sit amet consectetur. Est nunc pellentesque nisl pellentesque ultrices a lectus morbi vitae. Amet aliquam elementum consequat nam quisque dictum. Urna vel et ac placerat mi. Ut sit nunc nec risus egestas nunc amet fringilla aliquam. Odio enim nunc varius velit euismod risus aliquam ullamcorper. Adipiscing neque neque sit in. Dui varius odio velit eget pharetra nisl in purus velit. Turpis neque amet tortor luctus felis rhoncus ipsum. Nisi suspendisse aliquam vitae mauris. Cursus faucibus at habitant nisl elit tincidunt. Tortor nulla tortor ut lectus malesuada. Erat tincidunt aliquet justo id facilisi blandit vel nam. Ullamcorper est varius id erat nisl auctor. Quam in turpis eros ultrices dignissim sapien facilisis. Faucibus morbi euismod risus id aenean in. Quam aenean neque fusce at urna. Nisl sodales velit porta eu. Pharetra arcu non elementum ultricies tincidunt lectus fermentum. Morbi parturient enim quam tincidunt in et.")
                    .font(.system(size: 16))
                    .foregroundStyle(.white)
            }
            .padding()
            
            Spacer()
        }
        .background(.navy)
        .ignoresSafeArea()
        
        
    }
        
}


#Preview {
    ReviewMovieView()
        
}
