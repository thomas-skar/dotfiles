{ withSystem, ... }:
{
  flake.homeModules.obsidian = withSystem "x86_64-linux" (
    { pkgs, ... }: {
      programs.obsidian = {
        enable = true;
        cli.enable = true;

        vaults = {
          "vault" = {
            enable = true;
            target = "vault"; # ~/vault
          };
        };

        # TODO: enable vim mode + beybinds
        defaultSettings = {
          app = {
            showLineNumber = true;
          };
          appearance = {
            theme = "obsidian";
            cssTheme = "Minimal";
            nativeMenus = false;
            showRibbon = false;
            showViewHeader = true;
          };
          corePlugins = [
            {
              name = "audio-recorder";
              enable = false;
            }
            {
              name = "backlink";
              enable = true;
            }
            {
              name = "bases";
              enable = false;
            }
            {
              name = "bookmarks";
              enable = false;
            }
            {
              name = "canvas";
              enable = false;
            }
            {
              name = "command-palette";
              enable = true;
            }
            {
              name = "daily-notes";
              enable = false;
            }
            {
              name = "editor-status";
              enable = true;
            }
            {
              name = "file-explorer";
              enable = true;
            }
            {
              name = "file-recovery";
              enable = true;
            }
            {
              name = "footnotes";
              enable = false;
            }
            {
              name = "global-search";
              enable = true;
            }
            {
              name = "graph";
              enable = true;
            }
            {
              name = "markdown-importer";
              enable = false;
            }
            {
              name = "note-composer";
              enable = false;
            }
            {
              name = "outgoing-link";
              enable = true;
            }
            {
              name = "outline";
              enable = false;
            }
            {
              name = "page-preview";
              enable = true;
            }
            {
              name = "properties";
              enable = true;
            }
            {
              name = "publish";
              enable = false;
            }
            {
              name = "random-note";
              enable = false;
            }
            {
              name = "slash-command";
              enable = true;
            }
            {
              name = "slides";
              enable = false;
            }
            {
              name = "switcher";
              enable = true;
            }
            {
              name = "sync";
              enable = true;
            }
            {
              name = "tag-pane";
              enable = false;
            }
            {
              name = "templates";
              enable = false;
            }
            {
              name = "webviewer";
              enable = false;
            }
            {
              name = "word-count";
              enable = false;
            }
            {
              name = "workspaces";
              enable = false;
            }
            {
              name = "zk-prefixer";
              enable = false;
            }
          ];
          communityPlugins = [
            {
              pkg = pkgs.obsidianPlugins.obsidian-linter;
              enable = true;
              settings = {
                displayChanged = false;
                displayLintOnFileChangeNotice = false;
                lintOnSave = true;
                ruleConfigs = {
                  add-blank-line-after-yaml.enabled = true;
                  auto-correct-common-misspellings.enabled = false;
                  blockquote-style = {
                    enabled = true;
                    style = "space";
                  };
                  consecutive-blank-lines.enabled = true;
                  convert-bullet-list-markers.enabled = true;
                  emphasis-style = {
                    enabled = true;
                    style = "consistent";
                  };
                  empty-line-around-code-fences.enabled = true;
                  empty-line-around-horizontal-rules.enabled = true;
                  empty-line-around-math-blocks.enabled = true;
                  empty-line-around-tables.enabled = true;
                  file-name-heading.enabled = false;
                  footnote-after-punctuation.enabled = true;
                  format-tags-in-yaml.enabled = true;
                  header-increment = {
                    enabled = true;
                    start-at-h2 = true;
                  };
                  heading-blank-lines = {
                    bottom = true;
                    empty-line-after-yaml = true;
                    enabled = true;
                  };
                  headings-start-line.enabled = true;
                  insert-yaml-attributes = {
                    enabled = true;
                    text-to-insert = "aliases: \ntags: ";
                  };
                  line-break-at-document-end.enabled = true;
                  move-footnotes-to-the-bottom = {
                    enabled = true;
                    include-blank-line-between-footnotes = true;
                  };
                  move-tags-to-yaml = {
                    enabled = true;
                    how-to-handle-existing-tags = "Nothing";
                    tags-to-ignore = "";
                  };
                  re-index-footnotes.enabled = true;
                  remove-consecutive-list-markers.enabled = true;
                  remove-empty-lines-between-list-markers-and-checklists.enabled = true;
                  remove-empty-list-markers.enabled = true;
                  space-after-list-markers.enabled = true;
                  strong-style = {
                    enabled = true;
                    style = "consistent";
                  };
                  trailing-spaces = {
                    enabled = true;
                    two-space-line-break = false;
                  };
                  unordered-list-style = {
                    enabled = true;
                    list-style = "consistent";
                  };
                };
              };
            }
            {
              pkg = pkgs.obsidianPlugins.obsidian-editor-shortcuts;
              enable = true;
              settings = { };
            }
            {
              pkg = pkgs.obsidianPlugins.obsidian-minimal-settings;
              enable = true;
              settings = {
                colorfulHeadings = true;
                lineWidth = 100;
                lineWidthWide = 100;
              };
            }
            {
              pkg = pkgs.obsidianPlugins.nixsync;
              enable = false;
              settings = { };
            }
          ];
          themes = [
            {
              pkg = pkgs.obsidianThemes.minimal;
              enable = true;
            }
          ];
          hotkeys = {
            "command-palette:open" = [
              {
                key = "P";
                modifiers = [
                  "Mod"
                  "Shift"
                ];
              }
            ];
            "editor:delete-paragraph" = [ ];
            "editor:swap-line-down" = [
              {
                key = "ArrowDown";
                modifiers = [
                  "Alt"
                ];
              }
            ];
            "editor:swap-line-up" = [
              {
                key = "ArrowUp";
                modifiers = [
                  "Alt"
                ];
              }
            ];
            "editor:toggle-checklist-status" = [ ];
            "file-explorer:new-file-in-new-pane" = [ ];
            "switcher:open" = [
              {
                key = "P";
                modifiers = [
                  "Mod"
                ];
              }
            ];
            "workspace:new-window" = [
              {
                key = "N";
                modifiers = [
                  "Mod"
                  "Shift"
                ];
              }
            ];
            "workspace:split-horizontal" = [
              {
                key = "ArrowDown";
                modifiers = [
                  "Alt"
                  "Shift"
                ];
              }
            ];
            "workspace:split-vertical" = [
              {
                key = "ArrowRight";
                modifiers = [
                  "Alt"
                  "Shift"
                ];
              }
            ];
            "obsidian-editor-shortcuts:addCursorsToSelectionEnds" = [ ];
            "obsidian-editor-shortcuts:copyLineDown" = [ ];
            "obsidian-editor-shortcuts:copyLineUp" = [ ];
            "obsidian-editor-shortcuts:deleteLine" = [ ];
            "obsidian-editor-shortcuts:duplicateLine" = [ ];
            "obsidian-editor-shortcuts:goToLineEnd" = [
              {
                key = "ArrowRight";
                modifiers = [
                  "Meta"
                ];
              }
            ];
            "obsidian-editor-shortcuts:goToLineStart" = [
              {
                key = "ArrowLeft";
                modifiers = [
                  "Meta"
                ];
              }
            ];
            "obsidian-editor-shortcuts:insertLineBelow" = [ ];
            "obsidian-editor-shortcuts:selectAllOccurrences" = [ ];
          };
        };
      };
    }
  );
}
