# KinoSmartcellTemplate

[![Twitter Follow](https://img.shields.io/twitter/follow/ac_alejos?style=social)](https://twitter.com/ac_alejos)

This is a template project for making an [Elixir Kino Smart Cell](https://hexdocs.pm/kino/Kino.SmartCell.html) module for use in [Livebook](https://livebook.dev/). Uses the following stack:

* [Vite](https://vitejs.dev/) as the build system
  * You can elect to use any front-end framework you desire by adding its requisite [Vite Plugin](https://vitejs.dev/plugins/).
* [TailwindCSS](https://tailwindcss.com/) for CSS / Styling
  * Uses the color palette provided by the official Livebook team from the [`kino_bundler`](<https://www.npmjs.com/package/@livebook/kino-bundler>) package

For an example of a project built using this template, you can refer to [Merquery](https://www.github.com/acalejos/merquery), which uses the [Vite Vue Plugin](https://github.com/vitejs/vite-plugin-vue/tree/main/packages/plugin-vue)

## Directory Structure

```
.
├── README.md
├── assets -------------------------> Includes JS development files (can be excluded in release)
│   ├── package.json
│   ├── postcss.config.js
│   ├── src
│   │   ├── main.css
│   │   └── main.js
│   ├── tailwind.config.js ---------> Tailwind Config including the Livebook color palette
│   └── vite.config.js -------------> Vite config specific to building for a Kino.SmartCell
├── lib ----------------------------> Contains Elixir files (/build folder will be generated in this dir)
│   ├── application.ex -------------> Registers smart cell(s) to be exposed
│   └── kino_smartcell_template.ex -> Contains smart cell implementation
└── mix.exs
```

## Usage

1. Create a new repo from this template as shown [here](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template#creating-a-repository-from-a-template)
1. Clone a local copy
1. Change all references to `kino_smartcell_template` and `KinoSmartCellTemplate` to your application's name
1. From within the `lib/assets` directory run `npm i` to install dependencies.
    1. Optionally add any plugins or other dependencies you need
1. From within `lib/assets` run `npm run dev` to start a watchful Vite build. Now when you make changes they will
automatically be rebuilt by Vite. **Note that you will still need to reload the smart cell from Livebook to register the changes to the build**

## Building for Release

From within the assets folder run `npm build` and the minified/bundled releases will be put into
`/lib/build/` and be built for production.
