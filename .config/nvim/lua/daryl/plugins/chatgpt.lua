-- import chatgpt plugin safely
local setup, chatgpt = pcall(require, "chatgpt")
if not setup then
  return
end

-- enable comment
chatgpt.setup({
  api_key_cmd = "gopass show -o apis/chatgpt/nvim",
})
