# frozen_string_literal: true

module SublInit
  module Thor
    module Ruby
      extend SublInit::Thor::Support

      commands do
        option :new, type: :boolean, default: false
        option :name, aliases: '-n', required: true
        option :gemset, aliases: '-g'
        option :open, aliases: '-o', type: :boolean, default: true
        option :origin, aliases: '-or'
        desc 'ruby [NEW] [NAME] [GEMSET] [OPEN] [ORIGIN]', 'Initialize a new Ruby Sublime Text project'
        def ruby
          ruby_version = RUBY_VERSION

          project_name = options[:name]
          ruby_gemset = options[:gemset]

          within project_name, if: options[:new] do
            # 1. Create RVM gemset
            operation "Creating #{ruby_gemset} gemset for Ruby #{ruby_version}", if: ruby_gemset do
              SublInit::CLI::RVM.create_gemset(ruby_gemset)
            end

            # 2. Create versions.conf
            operation 'Creating .versions.conf file' do
              SublInit::Project::Files::Ruby::VersionsConf.create!(
                ruby_version: ruby_version, ruby_gemset: ruby_gemset
              )
            end

            # 3. Create Sublime Text project file
            sublime_project = operation "Creating #{project_name}.sublime-project" do
              gemset_folder_path = SublInit::Project::RVM::Gemset.new(ruby_version, ruby_gemset).path

              SublInit::Project::Files::SublimeProject.create!(
                project_name: project_name,
                additional_folders: [
                  {
                    name: 'Gems',
                    path: gemset_folder_path
                  }
                ]
              )
            end

            # 4. Initialize Git repository
            operation 'Initializing git repository' do
              SublInit::CLI::Git.init
            end

            # 5. Add remote
            operation "Adding #{options[:origin]} as origin git remote", if: options[:origin] do
              SublInit::CLI::Git.add_remote(:origin, options[:origin])
            end

            # 6. Open Sublime Text Project
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
