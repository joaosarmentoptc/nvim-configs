local dap = require("dap")
local dap_vscode_js = require("dap-vscode-js")

dap_vscode_js.setup({
  debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
  adapters = { "pwa-node" },
})

for _, lang in ipairs({ "javascript", "typescript" }) do
  dap.configurations[lang] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch Express App",
      program = "${workspaceFolder}/index.js",
      cwd = vim.fn.getcwd(),
      runtimeExecutable = "node",
      console = "integratedTerminal",
      skipFiles = { "<node_internals>/**" },
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to Node",
      processId = require("dap.utils").pick_process,
      cwd = vim.fn.getcwd(),
    },
  }
end
