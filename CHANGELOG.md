# Changelog

All notable changes to this project will be documented in this file.

## [1.0.1] - 2025-08-04

### 🔧 Improved
- Updated `GlassContainer` with inline DartDoc documentation for all public API elements to meet pub.dev standards.
- Internal code refactored for better readability and maintainability.
- Made `useGradient` default to `true` for better glass morphism effect.

### 🐛 Fixed
- Fixed documentation warnings preventing package publication.

---

## [1.0.0] - 2025-08-04

### ✨ Added
- Initial release of `glossy_morphism`.
- `GlassContainer` widget with:
  - Blur effect
  - Opacity control
  - Custom height & width
  - Border radius customization
  - Optional shadow
  - Custom border color and width
  - Optional gradient support
  - Support for any child widget

### 🐛 Known Limitations
- No animations included yet.
- Gradient and color cannot be used together — one at a time.
