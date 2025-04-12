# I DIDNT OWN THE SCRIPT I JUST PICKUP IT SOMEWHERE AND MAKE IT COMPATIBLE WITH MY SERVER PACK ANY ERROR YOU RECEIVE YOU FIX NO SUPPORT 

# catdev-autoprocess Script

## Features

### General
- **FiveM Compatibility**: Designed for use with the FiveM framework.
- **Lua 5.4 Support**: Utilizes Lua 5.4 for scripting.
- **Modular Design**: Organized into separate client, server, and shared scripts for maintainability.

### User Interface
- **Custom HTML/CSS UI**:
  - Interactive UI elements for displaying process progress.
  - Styled with [Code.css](Interface/CssCode/Code.css) and [contextMenu.min.css](Interface/CssCode/contextMenu.min.css).
- **Dynamic Content**:
  - Displays process headers, progress bars, and item slots dynamically.
  - Uses [Code.js](Interface/JsCode/Code.js) for dynamic updates.
- **Responsive Design**:
  - Compatible with various screen sizes and resolutions.

### Animations
- **Materialize Framework**:
  - Includes animations and transitions using [materialize.js](Interface/JsCode/materialize.js) and [materialize.min.js](Interface/JsCode/materialize.min.js).
- **Loading Animations**:
  - Smooth progress bar animations for in-game processes.

### Sound Effects
- **Audio Feedback**:
  - Plays sound effects (e.g., `Success.mp3`) during key events.
  - Located in the [Sound](Interface/Sound/) directory.

### Key Bindings
- **Cancel Process**:
  - Press `Q` to cancel the auto process.
- **Interactive Prompts**:
  - Displays key prompts (e.g., `Press E to interact`) dynamically.

### Item Management
- **Dynamic Item Display**:
  - Displays items dynamically in the UI with images and descriptions.
  - Supports item removal and updates in real-time.

### Configuration
- **Settings**:
  - Configurable settings in [FxwSettings.Item.lua](Settings/FxwSettings.Item.lua) and [FxwSettings.Notify.lua](Settings/FxwSettings.Notify.lua).
- **Manifest**:
  - Configured via [fxmanifest.lua](fxmanifest.lua) for FiveM compatibility.

### File Structure
- **Client Scripts**:
  - [CodeCl.lua](CodeLua/CodeCl.lua): Handles client-side logic.
- **Server Scripts**:
  - [CodeSv.lua](CodeLua/CodeSv.lua): Handles server-side logic.
- **Shared Scripts**:
  - Shared logic for both client and server.
