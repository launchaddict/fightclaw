import fs from 'fs';

// Read SVG file
const svg = fs.readFileSync('profile.svg', 'utf-8');

// Send as base64 PNG - not supported in Node without canvas
// Sending SVG data for browser rendering
const base64 = Buffer.from(svg).toString('base64');

console.log('data:image/svg+xml;base64,' + base64);
