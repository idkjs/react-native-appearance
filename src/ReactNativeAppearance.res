// type rec colorSchemeName = [#Light | #Dark | #NoPreference]

module ColorSchemeName = {
  type t = string
  @bs.inline
  let light = "light"
  @bs.inline
  let dark = "dark"
  @bs.inline
  let noPreference = "no-preference"
}
type colorSchemeName = ColorSchemeName.t
type appearancePreferences = {colorScheme: ColorSchemeName.t}
type appearanceListener = (~preferences: appearancePreferences) => unit
type listener = colorSchemeName => unit

type useSubscription<'a> = (~subscription: 'a) => 'a

@bs.module("react-native-appearance")
external useColorScheme: unit => ColorSchemeName.t = "useColorScheme"

@bs.module("react-native-appearance")
external addChangeListener: unit => unit = "addChangeListener"

@bs.module("react-native-appearance")
external removeChangeListener: unit => unit = "removeChangeListener"

@bs.module("react-native-appearance") @bs.scope("Appearance")
external getColorScheme: unit => ColorSchemeName.t = "getColorScheme"

@bs.module("react-native-appearance") @bs.scope("Appearance")
external set: colorSchemeName => unit = "set"

module AppearanceProvider = {
  @bs.module("react-native-appearance") @react.component
  external make: (~children: React.element) => React.element = "AppearanceProvider"
}
