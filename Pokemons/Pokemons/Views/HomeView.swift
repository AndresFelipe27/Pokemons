//
//  HomeView.swift
//  Pokemons
//
//  Created by User on 10/02/25.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundSection
                contentSection
            }
        }
        .navigationBarHidden(true)
    }
    
    private var backgroundSection: some View {
        GeometryReader { geometry in
            Image("background-home")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            .black.opacity(0.6),
                            .black.opacity(0.3)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .ignoresSafeArea()
        }
    }
    
    private var contentSection: some View {
        VStack{
            Spacer()
            titleSection
            Spacer()
            actionButton
                .padding(.bottom, 50)
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 16) {
            Text("Pokémon")
                .font(.system(size: 48, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
            Text("¡Explora el mundo Pokémon!")
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.9))
                .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 1)
        }
        .padding(.horizontal, 20)
        .multilineTextAlignment(.center)
    }
    
    private var actionButton: some View {
        NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
            Text("¡Ir a la Pokédex!")
                .font(.system(size: 22, weight: .bold, design: .rounded))
            
            .foregroundColor(.white)
            .frame(minWidth: 250)
            .frame(height: 60)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.red.opacity(0.8),
                        Color.red
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .strokeBorder(.white.opacity(0.3), lineWidth: 1)
            )
            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
            .padding(.horizontal, 30)
        }
        .buttonStyle(ScaleButtonStyle())
    }
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    HomeView()
}
