//
//  ContentView.swift
//  HeroAnimation
//
//  Created by Visarut Tippun on 1/5/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentIndex: Int = 0
    @State private var currentTab: String = "Flims"
    
    @State private var detailMovie: Movie?
    @State private var showDetailView: Bool = false
    
    @State private var currentCardSize: CGSize = .zero
    
    @Namespace private var animation
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(spacing: 0) {
                NavBarView()
                
                SnapCarousel(spacing: 20, trailingSpace: 110, index: $currentIndex, items: movies) { movie in
                    GeometryReader { proxy in
                        let size = proxy.size
                        
                        Image(movie.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .cornerRadius(16)
                    } //: GeometryReader
                } //: SnapCarousel
                .padding(.top, 80)
                
                DotIndocatorView()
                
                HStack {
                    Text("Popular")
                        .font(.title3.bold())
                    
                    Spacer()
                    
                    Button {
                        //
                    } label: {
                        Text("See more")
                            .font(.system(size: 16, weight: .semibold))
                    }
                } //: HStack
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(movies) { movie in
                            Image(movie.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 120)
                                .cornerRadius(16)
                        } //: ForEach
                    } //: HStack
                    .padding()
                } //: ScrollView
            } //: VStack
        } //: ZStack
    }
    
    @ViewBuilder
    func DotIndocatorView() -> some View {
        HStack(spacing: 6) {
            ForEach(movies.indices, id: \.self) { index in
                Circle()
                    .fill(currentIndex == index ? .red : .gray.opacity(0.5))
                    .frame(width: currentIndex == index ? 10 : 6,
                           height: currentIndex == index ? 10 : 6)
            } //: ForEach
        } //: HStack
        .animation(.easeOut, value: currentIndex)
    }
    
    @ViewBuilder
    func NavBarView() -> some View {
        HStack(spacing: 0) {
            ForEach(["Flims", "Localities"], id: \.self) { tab in
                Button {
                    withAnimation {
                        currentTab = tab
                    }
                } label: {
                    Text(tab)
                        .foregroundColor(.white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 20)
                        .background {
                            if currentTab == tab {
                                Capsule()
                                    .fill(.regularMaterial)
                                    .environment(\.colorScheme, .dark)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                }

            }
        }
    }
    
    @ViewBuilder
    func BackgroundView() -> some View {
        GeometryReader { proxy in
            let size = proxy.size
            TabView(selection: $currentIndex) {
                ForEach(movies.indices, id: \.self) { index in
                    Image(movies[index].image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipped()
                        .tag(index)
                } //: ForEach
            } //: TabView
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeOut, value: currentIndex)
            
            let color: Color = scheme == .dark ? .black : .white
            LinearGradient(colors: [.black,
                                    .clear,
                                    color.opacity(0.15),
                                    color.opacity(0.5),
                                    color.opacity(0.8),
                                    color,
                                    color],
                           startPoint: .top,
                           endPoint: .bottom)
            
            Rectangle()
                .fill(.ultraThinMaterial)
        } //: GeometryReader
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
