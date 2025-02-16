//
//  Home.swift
//  ParallaxCarousel
//
//  Created by HASAN BERAT GURBUZ on 8.10.2024.
//

import SwiftUI

struct Home: View {

    // MARK: - BODY

    var body: some View {

        // MARK: - TOP DESCRIPTION VIEW

        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading) {
                Text("Hi, Hasan!")
                    .opacity(0.5)
                Text("Who is your favorite hero?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .padding()

        // MARK: -  CARD DESIGN

        ScrollView(.vertical) {
                GeometryReader { proxy in
                    let size = proxy.size
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(cardList) { card in
                                GeometryReader { geometry in
                                    let cardSize = geometry.size
                                    let minX = min(geometry.frame(in: .scrollView).minX * 1.4, geometry.size.width * 1.5)
                                    Image(card.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .offset(x: -minX)
                                        .frame(width: cardSize.width * 1.5)
                                        .frame(width: cardSize.width, height: cardSize.height)
                                        .overlay(content: {
                                            BottomDescriptionView(title: card.title, subTitle: card.subTitle)
                                        })
                                        .clipShape(.rect(cornerRadius: 20))
                                        .shadow(color: .black.opacity(0.15), radius: 8, x: 5, y: 10)
                                }
                                .frame(width: size.width - 30, height: size.height - 50)
                                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                    view.scaleEffect(phase.isIdentity ? 1 : 0.95)
                                }
                            }
                        }
                        .padding(10)
                        .scrollTargetLayout()
                        .frame(height: size.height, alignment: .top)
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .scrollIndicators(.hidden)
                }
                .frame(height: 500)
                .padding(.horizontal, 10)
                .padding(.top, 10)
            }
            .padding()
        }
    }


    // MARK: - BOTTOMDESCRIPTIONVIEW

    private func BottomDescriptionView(title: String, subTitle: String) -> some View {
        ZStack(alignment: .bottomLeading) {
            LinearGradient(
                colors: [
                    .clear,
                    .black.opacity(0.5)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.title)
                    .bold()
                Text(subTitle)
            }
            .foregroundStyle(.white)
            .padding()
        }
    }
}

// MARK: - PREVIEW

#Preview {
    ContentView()
}
