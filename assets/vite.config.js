import { defineConfig } from "vite";
// For Vue
// import vue from "@vitejs/plugin-vue";

// For React
// import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  root: "./src/",
  // Load plugins here, eg.
  // plugins: [vue(), react()],
  plugins: [],
  build: {
    // If you change this output dir, you must change your assets_path in kino_smartcell_template.ex
    outDir: "../lib/build",
    rollupOptions: {
      preserveEntrySignatures: "exports-only",
      input: "./src/main.js",
      output: {
        dir: "./build",
        entryFileNames: "main.js",
        assetFileNames: "main.css",
      },
    },
  },
});
