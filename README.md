# KinoSmartcellTemplate

This is a template project for making an Elixir Kino Smart Cell module. Uses the following stack:

* [Vite](https://vitejs.dev/) as the build system
  * You can elect to use any front-end framework you desire by adding its requisite [Vite Plugin](https://vitejs.dev/plugins/).
* [TailwindCSS](https://tailwindcss.com/) for CSS / Styling
  * Uses the color palette provided by the official Livebook team from the [`kino_bundler`](<https://www.npmjs.com/package/@livebook/kino-bundler>) package

For an example of a project built using this template, you can refer to [Merquery](https://www.github.com/acalejos/merquery), which uses the [Vite Vue Plugin]

## Directory Structure

```

```

## Usage

1. Clone this repo
2. Change all references to `kino_smartcell_template` and `KinoSmartCellTemplate` to your application's name
3. From within the `lib/assets` directory run `npm i` to install dependencies.
  a. Optionally add any plugins or other dependencies you need
4. From within `lib/assets` run `npm run dev` to start a watchful Vite build. Now when you make changes they will
automatically be rebuilt by Vite. **Note that you will still need to reload the smart cell from Livebook to register the changes to the build**

## Building for Release

From within the assets folder run `npm build` and the minified/bundled releases will be put into
`/lib/build/` and be built for production.
