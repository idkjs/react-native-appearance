open ReactNative

let styles = {
  open Style
  StyleSheet.create({
    "container": style(~flex=1., ~alignItems=#center, ~justifyContent=#center, ()),
    "text": style(~fontSize=16., ~marginBottom=24.->dp, ~fontWeight=#bold, ()),
    "footer": style(
      ~position=#absolute,
      ~bottom=8.->dp,
      ~left=8.->dp,
      ~right=8.->dp,
      ~alignItems=#center,
      ~justifyContent=#center,
      ~flexDirection=#row,
      (),
    ),
  })
}
// ReasonReactNative as an Appearance module so alias to get the one we want
module RNAppearance = ReactNativeAppearance
open RNAppearance
export default = () => {
  let colorScheme = useColorScheme()
  let isDark = colorScheme == "dark"

  let color = isDark ? "#f1f1f1" : "#333"
  <AppearanceProvider>
    <View
      style={Style.array([
        styles["container"],
        Style.style(~backgroundColor=isDark ? "#333" : "#f1f1f1", ()),
      ])}>
      <Text style={Style.array([styles["text"], Style.style(~color, ())])}>
        {colorScheme->React.string}
      </Text>
      <Button
        title="Get Current Scheme"
        onPress={_e => {
          // to show output on web. Need fix alert on web
          Js.log(RNAppearance.getColorScheme())
          Alert.alert(~title=RNAppearance.getColorScheme(), ())
        }}
      />
    </View>
  </AppearanceProvider>
}
