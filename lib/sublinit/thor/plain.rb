# frozen_string_literal: true

module SublInit
  module Thor
    module Plain
      extend SublInit::Thor::Support

      commands do
        option :new, type: :boolean, default: false
        option :name, aliases: '-n', required: true
        option :open, aliases: '-o', type: :boolean, default: true
        option :origin, aliases: '-or'
        desc 'plain [NEW] [OPEN] [ORIGIN]', 'Initialize a new Plain Sublime Text project'
        def plain
          project_name = options[:name]

          within project_name, if: options[:new] do
            # 1. Create Sublime Text project file
            sublime_project = operation "Creating #{project_name}.sublime-project" do
              SublInit::Project::Files::SublimeProject.create!(
                project_name: project_name
              )
            end

            # 2. Open Sublime Text Project
            operation "Opening #{sublime_project} in Sublime Text", if: (sublime_project && options[:open]) do
              SublInit::CLI::Sublime::Text.open(sublime_project)
            end

            say("Done! Your project path is #{Dir.pwd}", color: :green)
          end
        end
      end
    end
  end
end
