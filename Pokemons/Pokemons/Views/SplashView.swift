//
//  SplashView.swift
//  Pokemons
//
//  Created by User on 10/02/25.
//

import SwiftUI

struct SplashView: View {
    
    private enum Constants {
        static let animationDelay: Double = 0.9
        static let animationDuration: Double = 0.8
        static let splashImageSize: CGFloat = 180
        static let shadowRadius: CGFloat = 10
    }
    
    @State private var animate = false
    @State private var endSplash = false
    
    var body: some View {
        ZStack {
            HomeView()
            splashOverlay
        }
    }
    
    private var splashOverlay: some View {
        ZStack {
            background
            splashImage
        }
        .ignoresSafeArea()
        .onAppear(perform: animateSplash)
        .opacity(endSplash ? 0 : 1)
    }
    
    private var background: some View {
        Color("background")
            .ignoresSafeArea()
    }
    
    private var splashImage: some View {
        Image("pikachu-splash")
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: Constants.splashImageSize, height: Constants.splashImageSize)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.white.opacity(0.2), lineWidth: 2)
            )
            .background(
                Circle()
                    .fill(Color("background"))
                    .shadow(
                        color: Color("font").opacity(0.3),
                        radius: Constants.shadowRadius,
                        x: 0,
                        y: 5
                    )
            )
            .scaleEffect(animate ? 1.1 : 1.0)
            .animation(.easeInOut(duration: Constants.animationDuration/2), value: animate)
    }
    
    private func animateSplash() {
        withAnimation(.easeInOut(duration: Constants.animationDuration/2)) {
            animate = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.animationDelay) {
            withAnimation(.easeOut(duration: Constants.animationDuration)) {
                endSplash = true
            }
        }
    }
}

#Preview {
    SplashView()
}
