require('orgmode').setup_ts_grammar()

local stepByStepGuide = [[BLOGPOST TITLE: %?
%u
* How to Do YouTube Keyword Research in 3 Easy Steps

- Title: Use the 'How to' format
- Mention the desired outcome
- List the number of steps

Looking to grow your YouTube channel and attract more views? The "trick" is to target topics with search demand.

This is the approach that helped us grow our YouTube channel from ~10,000 to over 200,000 monthly views in around a year.

** Step 1: Map out a hierarchy of topics

- Use H2 subheadings
- Number them
- Start each one with a present tense verb

** Step 2: Generate keyword ideas and find search volumes

Lorem Ipsum Dolor Sit Amet.

** Final Thoughts

- Summarize key points
- Keep it short
]]

local listPost = [[BLOGPOST TITLE: %?
%u
* 11 Proven Ways to Drive Traffic to Your Website

Title:
- Start with the number of items. 
- Mention the desired outcome (where it makes sense)
- Take inspiration from top-ranking pages

Feeling overwhelmed by the infinite options for driving traffic to your website? You're not alone.

This article doesn't list every traffic strategy under the sun. 

Instead, it lists the tactics we use. These are tactics that have helped us grow our revenue by +65% year over year.

Let's get to it.

1. Subheadline
2. Subheadline
3. Subheadline

Intro: 

- Keep it short
- Try to establish trust in as few words as possible
- Add a table of contents with jump links.

** Collaborate with other brands to tap into their audience.

  For most businesses, there are plenty of non-competing brands with the same or similar target audience.

  So why not work together to cross-promote to each other's audiences?

  List Items:

  - Use <h2> subheadings
  - Number them (where appropriate)
  - Make them benefit-focused


** Final Thoughts

In this post, I've only included tactics that are free or require limited resources. Of course, if you have the budget and are willing to spend, don't forget that you can always buy paid traffic from platforms like Google, Facebook, Twitter, Quora, etc.

Conclusion:

- Give one or two final tips
- Keep it short
]]

-- Treesitter configuration
require('nvim-treesitter.configs').setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop,
  -- highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    -- Required for spellcheck, some LaTex highlights and
    -- code block highlights that do not have ts grammar
    additional_vim_regex_highlighting = {'org'},ured

  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/org/*', '~/org/notes/*', '~/org/**/**'},
  org_default_notes_file = '~/org/refile.org',
  org_capture_templates = {
    j = {
      description = 'Journal',
      template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?',
      target = '~/org/journal.org'
    },
    g = {
      description = 'Blogpost: Step by Step Guide Template',
      template = stepByStepGuide,
      target = '~/org/blogposts.org'
    },
    l = {
      description = 'Blogpost: List Post Template',
      template = listPost,
      target = '~/org/blogposts.org'
    }
  },
  org_custom_exports = {
    f = {
      label = 'Export to docx format',
      action = function(exporter)
        local current_file = vim.api.nvim_buf_get_name(0)
        local target = vim.fn.fnamemodify(current_file, ':p:r')..'.docx'
        local command = {'pandoc', current_file, '-o', target, '-t', 'docx'}
        local on_success = function(output)
          print('Success!')
          vim.api.nvim_echo({{ table.concat(output, '\n') }}, true, {})
        end
        local on_error = function(err)
          print('Error!')
          vim.api.nvim_echo({{ table.concat(err, '\n'), 'ErrorMsg' }}, true, {})
        end
        return exporter(command , target, on_success, on_error)
      end
    }
  }
})
