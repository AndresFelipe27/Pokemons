//
//  PokemonDetailView.swift
//  Pokemons
//
//  Created by User on 10/02/25.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var viewModel: PokemonViewModel
    let pokemon: Pokemon
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                headerSection
                basicInfoSection
                typesSection
                statsSection
            }
            .padding()
        }
        .background(Color("background").ignoresSafeArea())
        .onAppear {
            viewModel.getDetails(pokemon: pokemon)
        }
    }
    
    private var headerSection: some View {
        VStack {
            PokemonView(pokemon: pokemon)
            
            Text(pokemon.name.capitalized)
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(Color("font"))
        }
    }
    
    private var basicInfoSection: some View {
        HStack(spacing: 30) {
            InfoCard(title: "ID", value: "\(viewModel.pokemonDetails?.id ?? 0)")
            InfoCard(title: "Height", value: "\(viewModel.formatHW(value: viewModel.pokemonDetails?.height ?? 0)) m")
            InfoCard(title: "Weight", value: "\(viewModel.formatHW(value: viewModel.pokemonDetails?.weight ?? 0)) kg")
        }
    }
    
    private var typesSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Types")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color("font"))
            
            HStack(spacing: 15) {
                ForEach(viewModel.pokemonDetails?.types ?? [], id: \.slot) { type in
                    TypeBadge(typeName: type.type.name)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("background").opacity(0.6))
        )
    }
    
    private var statsSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Base Stats")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color("font"))
            
            VStack(spacing: 15) {
                ForEach(viewModel.pokemonDetails?.stats ?? [], id: \.stat.name) { stat in
                    StatRow(stat: stat)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("background").opacity(0.6))
        )
    }
}

struct InfoCard: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(Color("font").opacity(0.8))
            
            Text(value)
                .font(.system(.body, design: .monospaced))
                .fontWeight(.bold)
                .foregroundColor(Color("font"))
        }
        .frame(minWidth: 80)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color("background").opacity(0.6))
        )
    }
}

struct TypeBadge: View {
    let typeName: String
    
    var typeColor: Color {
        switch typeName {
        case "fire": return .red
        case "water": return .blue
        case "grass": return .green
        case "electric": return .yellow
        case "psychic": return .purple
        case "ice": return .cyan
        case "dragon": return .indigo
        case "dark": return .gray
        case "fairy": return .pink
        default: return .gray
        }
    }
    
    var body: some View {
        Text(typeName.capitalized)
            .font(.system(.subheadline, design: .rounded))
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(typeColor)
            )
    }
}

struct StatRow: View {
    let stat: PokemonStats
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(stat.stat.name.replacingOccurrences(of: "-", with: " ").capitalized)
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.medium)
                    .foregroundColor(Color("font"))
                
                Spacer()
                
                Text("\(stat.base_stat)")
                    .font(.system(.body, design: .monospaced))
                    .fontWeight(.bold)
                    .foregroundColor(Color("font"))
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 8)
                        .cornerRadius(4)
                    
                    Rectangle()
                        .fill(statColor(for: stat.base_stat))
                        .frame(width: min(CGFloat(stat.base_stat) / 255 * geometry.size.width, geometry.size.width), height: 8)
                        .cornerRadius(4)
                }
            }
            .frame(height: 8)
        }
    }
    
    private func statColor(for value: Int) -> Color {
        switch value {
        case 0...50: return .red
        case 51...80: return .orange
        case 81...120: return .green
        default: return .blue
        }
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon.samplePokemon)
        .environmentObject(PokemonViewModel())
}
