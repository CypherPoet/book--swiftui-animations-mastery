//
// AnimationEnabling_WatchingAValue_ExampleView.swift
// SwiftUIAnimationsMasteryPart2
//
// Created by CypherPoet on 2/6/21.
// ✌️
//

import SwiftUI


struct AnimationEnabling_WatchingAValue_ExampleView {
    @State private var temperature = Measurement(value: 10, unit: UnitTemperature.celsius)
    @State private var climateState = ClimateState.mild
    
    @ScaledMetric private var bodyFontSize = UIFont.preferredFont(forTextStyle: .body).pointSize
    @ScaledMetric private var headlineFontSize = UIFont.preferredFont(forTextStyle: .headline).pointSize
    
    static let indicatorAnimation = Animation
        .easeInOut(duration: AnimationDurations.colorChange)
}


// MARK: - `View` Body
extension AnimationEnabling_WatchingAValue_ExampleView: View {
    
    var body: some View {
        VStack(spacing: 28.0) {
            
            VStack(spacing: 14.0) {
                Text("Watching A Value")
                    .screenBanner()
                
                Text("""
                The first parameter for the animation modifier is the Animation itself. \
                The second parameter is 'value'. It's optional.

                When you change this value, the \
                animation takes effect. If it doesn't change since the last animation, then there will \
                be no animation. It HAS to change for the animation to happen.
                """
                )
            }
            
            ScreenSectionDivider()
            
            temperatureSliderSection
            
            Spacer()
            
            temperatureIndicatorSection
            
            Spacer()
        }
        .onChange(of: temperature, perform: { newTemperature in
            climateState = newTemperature.climateState
        })
        .padding()
        .navigationBarHidden(true)
    }
}


// MARK: - Computeds
extension AnimationEnabling_WatchingAValue_ExampleView {
    var sliderAccentColor: Color { climateState.color }
}


// MARK: - View Content Builders
private extension AnimationEnabling_WatchingAValue_ExampleView {
    
    var temperatureSliderSection: some View {
        GroupBox(
            label: (
                HStack {
                    Text("Temperature")
                        .font(.system(size: headlineFontSize, weight: .semibold, design: .rounded))
                        .foregroundColor(.accentColor)
                        .textCase(.uppercase)
                        .padding(.vertical, bodyFontSize * 0.5)
                }
            )
        ) {
            Slider(
                value: $temperature.value,
                in: -30...50,
                minimumValueLabel: Image(systemName: "thermometer.snowflake"),
                maximumValueLabel: Image(systemName: "thermometer.sun.fill")
            ) {
                Text("Temperature in Celsius")
            }
            .accentColor(sliderAccentColor)
            .labelsHidden()
            .padding(.vertical)
            
            Text(temperature, formatter: Formatters.largeTemperatureDisplay)
                .font(.system(size: bodyFontSize * 4, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .colorMultiply(climateState.color)
                .shadow(
                    color: climateState.color.opacity(0.43),
                    radius: bodyFontSize * 0.65,
                    x: 0.0,
                    y: 0.0
                )
                .animation(Self.indicatorAnimation, value: climateState.color)
        }
    }
    
    
    var temperatureIndicatorSection: some View {
        HStack {
            Spacer()
  
            IndicatorIconView(
                systemImageName: "snow",
                isActive: climateState == .cold,
                activeColor: ClimateState.cold.color
            )
            .animation(Self.indicatorAnimation, value: climateState.color)
            
            Spacer()

            IndicatorIconView(
                systemImageName: "flame.fill",
                isActive: climateState == .hot,
                activeColor: ClimateState.hot.color
            )
            .animation(Self.indicatorAnimation, value: climateState.color)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}


// MARK: - Private Helpers
private extension AnimationEnabling_WatchingAValue_ExampleView {
}


// MARK: - IndicatorIconView
extension AnimationEnabling_WatchingAValue_ExampleView {
    
    struct IndicatorIconView {
        var systemImageName: String
        var isActive: Bool
        var activeColor: Color
        
        @ScaledMetric private var bodyFontSize = UIFont.preferredFont(forTextStyle: .body).pointSize
    }
}


// MARK: - IndicatorIconView - View
extension AnimationEnabling_WatchingAValue_ExampleView.IndicatorIconView: View {
    
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .scaledToFit()
            .frame(width: bodyFontSize * 2.5)
            .foregroundColor(.white)
            .colorMultiply(isActive ? activeColor : Color.secondary.opacity(0.6))
            .scaleEffect(isActive ? 2.25 : 1, anchor: .center)
            .shadow(
                color: isActive ? activeColor.opacity(0.5) : Color.clear,
                radius: bodyFontSize * 1.5,
                x: 0.0,
                y: 0.0
            )
    }
}


// MARK: - ClimateState
extension AnimationEnabling_WatchingAValue_ExampleView {
    
    enum ClimateState {
        case cold
        case mild
        case hot
    }
}


// MARK: - ClimateState - Computeds
extension AnimationEnabling_WatchingAValue_ExampleView.ClimateState {
    
    var color: Color {
        switch self {
        case .cold:
            return Color("IcyCold")
        case .mild:
            return .yellow
        case .hot:
            return Color("Fire")
        }
    }
}


extension Measurement where UnitType == UnitTemperature {
    
    var climateState: AnimationEnabling_WatchingAValue_ExampleView.ClimateState {
        switch value {
        case ..<4:
            return .cold
        case 26...:
            return .hot
        default:
            return .mild
        }
    }
}


#if DEBUG
// MARK: - Preview
struct AnimationEnabling_WatchingAValue_ExampleView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            AnimationEnabling_WatchingAValue_ExampleView()
        }
    }
}
#endif
