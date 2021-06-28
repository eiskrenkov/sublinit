# frozen_string_literal: true

module SublInit
  module Thor
    module Ruby
      extend SublInit::Thor::Support

      commands do
        option :name, aliases: '-n', required: true
        option :gemset, aliases: '-g', required: true
        option :open, aliases: '-o', type: :boolean, default: true
        option :origin, aliases: '-or'
        desc 'ruby [NAME] [GEMSET] [OPEN]', 'Initialize a new Ruby Sublime Text project'
        def ruby
          ruby_version = RUBY_VERSION

          project_name = options[:name]
          ruby_gemset = options[:gemset]

          say("Creating #{ruby_gemset} gemset for Ruby #{ruby_version}...")
          SublInit::CLI::RVM.create_gemset(ruby_gemset)

          within(project_name) do
            # 1. Create versions.conf
            say('Creating .versions.conf file...')

            SublInit::Project::Files::Ruby::VersionsConf.new(
              ruby_version: ruby_version, ruby_gemset: ruby_gemset
            ).create!

            # 2. Create Sublime Text project file
            say("Creating #{project_name}.sublime-project...")

            gemset_folder_path = SublInit::Project::RVM::Gemset.new(ruby_version, ruby_gemset).path

            sublime_project = SublInit::Project::Files::SublimeProject.new(
              project_name: project_name,
              additional_folders: [
                {
                  name: 'Gems',
                  path: gemset_folder_path
                }
              ]
            ).create!

            # 3. Initialize Git repository
            say('Initializing git repository...')

            SublInit::CLI::Git.init

            # 4. Add remote
            if options[:origin]
              say("Adding #{options[:origin]} as origin git remote...")

              SublInit::CLI::Git.add_remote(:origin, options[:origin])
            end

            # 5. Open Sublime Text Project
            if options[:open]
              say("Opening #{sublime_project} in Sublime Text...")

              SublInit::CLI::Sublime::Text.open(sublime_project)
            end

            say("Done! Your new project path is #{Dir.pwd}", color: :green)
          end
        end
      end
    end
  end
end
