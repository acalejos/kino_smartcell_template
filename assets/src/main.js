import "./main.css";

// If using Vue
// import { createApp } from "vue";

// Is using React
// import React from "react";
// import { createRoot } from "react-dom/client";

// For React & Vue, assuming your main App is written in a file called App.{js,jsx,vue,etc.}
// import App from "./App";

// Here `ctx` is the Kino.JS context, and `payload` is the payload passed
// from your Elixir-side init function
export async function init(ctx, payload) {
  ctx.importCSS("main.css");
  ctx.importCSS(
    "https://fonts.googleapis.com/css2?family=Inter:wght@400;500&display=swap"
  );
  ctx.importCSS(
    "https://fonts.googleapis.com/css2?family=JetBrains+Mono&display=swap"
  );
  // Mount app here.

  // Eg. for Vue you could do:
  // const app = createApp(App, { ctx, payload });
  // app.mount(ctx.root);

  // For React it might look like this:
  // const root = createRoot(ctx.root);
  // root.render(<App ctx={ctx} payload={payload} />);

  // For the sake of having a working demonstration, here
  // is the implementation provided by the docs at:
  // https://hexdocs.pm/kino/Kino.SmartCell.html

  // As you can see, we can directly use Tailwind classes here
  ctx.root.innerHTML = `
        <div>
          <label for="source" class="block text-sm font-medium leading-6 text-gray-900">Add Your Source Here</label>
          <div class="mt-2">
            <textarea id="source" rows="4" name="source" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"></textarea>
          </div>
        </div>
      `;

  const textarea = ctx.root.querySelector("#source");
  textarea.value = payload.source;

  textarea.addEventListener("change", (event) => {
    ctx.pushEvent("update", { source: event.target.value });
  });

  ctx.handleEvent("update", ({ source }) => {
    textarea.value = source;
  });

  ctx.handleSync(() => {
    // Synchronously invokes change listeners
    document.activeElement &&
      document.activeElement.dispatchEvent(new Event("change"));
  });
}
