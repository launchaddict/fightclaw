# Claw Club Assets

## Profile Image (400x400px)
`profile.svg` - Square profile image for X/Twitter, Discord, etc.

## Header Image (1500x500px)
`header.svg` - Wide banner for X/Twitter header

## Favicon (32x32px)
`favicon.svg` - Small icon for browser tabs

## Usage

### Convert to PNG (for upload to X):
```bash
# Profile image (400x400)
inkscape profile.svg --export-type=png --export-filename=profile.png

# Header image (1500x500)
inkscape header.svg --export-type=png --export-filename=header.png

# Favicon (32x32)
inkscape favicon.svg --export-type=png --export-filename=favicon.png
```

### Without Inkscape (using ImageMagick):
```bash
convert profile.svg profile.png
convert header.svg header.png
convert favicon.svg favicon.png
```

### Online converters:
- CloudConvert.com
- SVGtoPNG.com
- VectorMagic.com

## Brand Colors

- **Primary Dark:** `#1a1a2e` (dark navy)
- **Secondary Dark:** `#0f0f1a` (almost black)
- **Gold/Accent:** `#ffd700` to `#ff8c00` (gold gradient)
- **Red (claw marks):** `#ff4444` (bright red)
- **Text Gold:** `url(#goldGradient)`
- **Muted Text:** `#8888aa` (soft purple-gray)

## Typography

- **Font:** Arial Black (main title), Arial (body)
- **Tagline Font:** Arial, sans-serif
- **URL Font:** Monaco, monospace

## Theme

- Dark, gritty, underground aesthetic
- Fight Club vibes
- Industrial/martial arts feel
- Bold gold accents on dark background
- Red claw marks for battle damage effect
