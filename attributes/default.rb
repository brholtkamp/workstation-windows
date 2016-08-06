# Overrides of workstation-common settings for Windows
override['workstation']['user'] = ENV['username']
override['workstation']['home'] = "#{node['msys2']['install_dir']}/home/#{node['workstation']['user']}"

# General settings
default['workstation']['packages'] += %w(man)
default['workstation']['applications'] = %w(1password ccleaner dropbox f.lux googlechrome malwarebytes skype slack visualstudiocode)
default['workstation']['games'] = %w(battle.net steam)

# Visual Studio settings
default['workstation']['visual_studio']['packages'] = %w(visualstudio2015community resharper)
default['workstation']['visual_studio']['extensions'] = [
  %w(TabSanity https://visualstudiogallery.msdn.microsoft.com/ac4d4d6b-b017-4a42-8f72-55f0ffe850d7/file/99636/9/TabSanity.vsix),
  %w(VsVim https://visualstudiogallery.msdn.microsoft.com/59ca71b3-a4a3-46ca-8fe1-0e90e3f79329/file/6390/59/VsVim.vsix)
]
default['workstation']['visual_studio']['extension_dir'] = "#{ENV['LocalAppData'].gsub(/\\+/, '/')}/Microsoft/VisualStudio/14.0/Extensions"
default['workstation']['visual_studio']['vsix_installer_dir'] = 'C:/Program Files (x86)/Microsoft Visual Studio 14.0/Common7/IDE'
