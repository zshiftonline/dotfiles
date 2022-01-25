import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.Ungrab

import XMonad.Layout.ThreeColumns

import XMonad.Hooks.EwmhDesktops

main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . withEasySB (statusBarProp "xmobar ~/.config/xmobar/xmobarrc" (pure def)) defToggleStrutsKey
     $ customConfig


customConfig = def
    { modMask       = mod4Mask          -- Rebind Mod to the Super key
    , layoutHook    = customLayout      -- Use custom layouts
    , manageHook    = customManageHook  -- Match certain windows
    }
  `additionalKeysP`
    [ ("M-S-Z", spawn "xscreensaver-command -lock"  )
    , ("M-S-=", unGrab *> spawn "scrot -s"          )
    , ("M-]"  , spawn "firefox"                     )
    ]

customManageHook :: ManageHook
customManageHook = composeAll
    [ className =? "Gimp"   --> doFloat
    , isDialog              --> doFloat
    ]


customLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
    where
        threeCol    = ThreeColMid nmaster delta ratio
        tiled       = Tall nmaster delta ratio
        nmaster     = 1         -- Default number of windows in the master pane
        ratio       = 1/2       -- Default proportion of screen occupied by master pane
        delta       = 3/100     -- Percent of screen to increment by when resizing panes


customXmobarPP :: PP
customXmobarPP = def
    { ppSep             = magenta " | "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white       "[") (white     "]") . magenta  . ppWindow
    formatUnfocused = wrap (lowWhite    "[") (lowWhite  "]") . blue     . ppWindow

    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta     = xmobarColor "#ff79c6" ""
    blue        = xmobarColor "#bd93f9" ""
    white       = xmobarColor "#f8f8f2" ""
    yellow      = xmobarColor "#f1fa8c" ""
    red         = xmobarColor "#ff5555" ""
    lowWhite    = xmobarColor "#bbbbbb" ""
