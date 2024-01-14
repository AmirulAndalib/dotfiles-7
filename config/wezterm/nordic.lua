return function(is_dark, assets)
  local config = {}

  if is_dark then
    -- config.color_scheme = "Nord (Gogh)"
    config.color_scheme = "Nocturnal Winter"
    config.window_background_opacity = 1
    config.background = {
      {
        source = {
          Gradient = {
            orientation = "Horizontal",
            colors = {
              "#272931",
              -- "#000026",
              -- "#00000C",
              "#272931",
            },
            interpolation = "CatmullRom",
            blend = "Rgb",
            noise = 0,
          },
        },
        width = "100%",
        height = "100%",
        opacity = 0.95,
      },
      {
        source = {
          File = { path = assets .. "/blob_blue.gif", speed = 0.3 },
        },
        repeat_x = "Mirror",
        -- width = "100%",
        height = "100%",
        opacity = 0.05,
        hsb = {
          hue = 0.9,
          saturation = 0.9,
          brightness = 0.8,
        },
      },
    }
  else
    config.color_scheme = "Nord Light (Gogh)"
    config.window_background_opacity = 1
    config.set_environment_variables = {
      THEME_FLAVOUR = "latte",
    }
  end

  return config
end
