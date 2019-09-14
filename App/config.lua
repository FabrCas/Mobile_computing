--
-- For more information on config.lua see the Project Configuration Guide at:
-- https://docs.coronalabs.com/guide/basics/configSettings
--

application =
{
  content =
  {
    width = 649,
    height = 960, 
    scale = "zoomStretch",  
    --"letterbox" scales the content area to fill the screen while preserving the same aspect ratio. The entire content area will reside on the screen, but this might result in "black bars" on devices with aspect ratios that differ from your content aspect ratio. Note, however, that you can still utilize this "blank" area and fill it with visual elements by positioning them or extending them outside the content area bounds. Essentially, "letterbox" is an ideal scale mode if you want to ensure that everything in your content area appears within the screen bounds on all devices.

--"zoomEven" scales the content area to fill the screen while preserving the same aspect ratio. Some content may "bleed" off the screen edges on devices with aspect ratios that differ from your content aspect ratio. Basically, "zoomEven" is a good option to ensure that the entire screen is filled by the content area on all devices (and content clipping near the outer edges is acceptable)
    fps = 60,


    imageSuffix =
    {
      ["@2x"] = 2,
      ["@4x"] = 4,
    },

  },
}
