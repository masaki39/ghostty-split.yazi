# ghostty-split.yazi

A yazi plugin to open Ghostty splits and tabs from the current directory.

## Requirements

- macOS with Ghostty
- AppleScript enabled in Ghostty (`macos-applescript = true`)

## Installation

```sh
ya pkg add masaki39/ghostty-split
```

## Usage

```toml
# keymap.toml
[[mgr.prepend_keymap]]
on = ["o", "l"]
run = "plugin ghostty-split right"
desc = "Open terminal split right"

[[mgr.prepend_keymap]]
on = ["o", "j"]
run = "plugin ghostty-split down"
desc = "Open terminal split down"

[[mgr.prepend_keymap]]
on = ["o", "t"]
run = "plugin ghostty-split tab"
desc = "Open terminal new tab"

[[mgr.prepend_keymap]]
on = ["o", "w"]
run = "plugin ghostty-split window"
desc = "Open terminal new window"
```

| Arg | Action |
|-----|--------|
| `right` | Split right (default) |
| `down` | Split down |
| `tab` | New tab |
| `window` | New window |
