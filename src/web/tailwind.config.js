/** @type {import('tailwindcss').Config} */
const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    './Pages/**/*.cshtml',
    './Pages/**/*.html',
    './Pages/**/*.vue',
  ],
  theme: {
    extend: {
      fontFamily: {
        inter: ["Inter var", ...defaultTheme.fontFamily.sans],
      }
    },
  },
  variants: {},
  plugins: [
    // eslint-disable-next-line global-require
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
  ],
}
