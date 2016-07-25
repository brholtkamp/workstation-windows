# workstation-windows

The Windows cookbook that's part of the [workstation-common](https://github.com/brholtkamp/workstation-common) system.  This cookbook is responsible for all Windows specific recipes and delegating the attributes from workstation-common into the appropriate resource providers for Windows.

# Recipes

## Core Recipes

- `default`: Will install [Chocolatey](https://chocolatey.org), [MSYS2](https://msys2.github.io), [ChefDK](https://downloads.chef.io/chef-dk), the dotfiles from workstation-common into the MSYS2 environment, and registers [chef-client](https://github.com/chef-cookbooks/chef-client) as a service to run on the Windows node.
- `install_chocolatey`: Will install Chocolatey.
- `install_msys2`: Will install MSYS2, some customizations to the MSYS2 environment, and all of the packages from workstation-common.

## Chocolatey Recipes

- `install_applications`: Will install core applications.
- `install_games`: Will install game software.
- `install_unity`: Will install [Unity3D](https://unity3d.com).
- `install_visual_studio`: Will install [Visual Studio 2015 Community](https://visualstudio.com) and extensions.

## Extra Recipes

- `setup_test_environment`: Will setup the node to be able to run [test-kitchen](https://kitchen.ci).

# Attributes

- `node['workstation']['applications']`: The list of applications to install.
- `node['workstation']['games']`: The list of game applications to install.
- `node['workstation']['visual_studio']['packages']`: The list of Chocolatey packages to install with `install_visual_studio`.
- `node['workstation']['visual_studio']['extensions']`: The list of extensions to install in with `install_visual_studio`.  Each item in the list is another list of `['Extension Name', 'URL to .vsix']`.
- `node['workstation']['visual_studio']['extension_dir']`: The path to where Visual Studio extensions are installed.
- `node['workstation']['visual_studio']['vsix_installer_dir']`: The path to `VSIXInstaller.exe`
