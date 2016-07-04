resource_name :msys2_execute
provides :msys2_execute

property :command, String, name_property: true
property :shell, [:mingw64, :mingw32, :msys], required: true
property :root, String, required: true

action_class do
  def run(comment, command)
    fixed_root = root.gsub(::File::SEPARATOR, ::File::ALT_SEPARATOR || '\\') if root

    case shell
    when :mingw64
      msystem = "MINGW64"
    when :mingw32
      msystem = "MINGW32"
    when :msys
      msystem = "MSYS"
    end

    execute comment do
      command ".\\bin\\bash.bat -c \"#{command}\""
      cwd fixed_root
      live_stream true
      environment('MSYSTEM' => msystem)
    end
  end
end

default_action :run

action :run do
  run("running #{command}", command)
end
