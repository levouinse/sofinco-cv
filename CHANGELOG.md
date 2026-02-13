# Changelog

## [Unreleased] - 2026-02-13

### Fixed
- Updated esbuild from 0.5.0 to 0.10.0 to fix 404 download error
- Updated tailwind from 0.1.10 to 0.4.1 for better compatibility
- Updated esbuild version in config from 0.17.11 to 0.23.0
- Updated tailwind version in config from 3.4.0 to 3.4.17
- Added `__sockets__/0` function to CvAppWeb module to reduce warnings

### Changed
- Improved Elixir 1.12.2+ compatibility
- All dependencies now compatible with Elixir 1.12 - 1.19

### Notes
- Remaining warnings are from Phoenix 1.6 dependencies (deprecated Logger.warn, typing violations)
- These warnings are harmless and will be resolved when upgrading to Phoenix 1.7+
- Application runs successfully on Elixir 1.12.2 through 1.19.5
