Download sdk manager deb package - you need ubuntu 20.04 for jetpack 5.x.y

latest sdk manager installs only 6.x.y - this is not for presien vpp support

For presienVpp to work - download docker ubuntu_20 on windows or linux laptop
and do command line execution with a UserInterface having cmline similar interface with minor UI.

![image](https://github.com/user-attachments/assets/aefca6d1-9f47-4c14-8231-3d806a5a468d)



Commands to run from windows cmd prompt




PS C:\MySpace\Tools\sdk_manager> docker load -i .\sdkmanager-2.1.0.11698-Ubuntu_20.04_docker.tar.gz
3ec3ded77c0c: Loading layer [==================================================>]  75.19MB/75.19MB
f29e9eaf37f6: Loading layer [==================================================>]  196.7MB/196.7MB
c62ef798c0d0: Loading layer [==================================================>]  3.559MB/3.559MB
d04a9bc76a8c: Loading layer [==================================================>]  1.701MB/1.701MB
efa458ebbf99: Loading layer [==================================================>]  1.702MB/1.702MB
aa5b4483b95d: Loading layer [==================================================>]  3.446MB/3.446MB
9c88d7fff02b: Loading layer [==================================================>]  62.65MB/62.65MB
0e4b6cab1889: Loading layer [==================================================>]  25.87MB/25.87MB
2c90c7d67d9d: Loading layer [==================================================>]  70.23MB/70.23MB
28815ca61e87: Loading layer [==================================================>]  2.493MB/2.493MB
5f70bf18a086: Loading layer [==================================================>]  1.024kB/1.024kB
5632e476344d: Loading layer [==================================================>]  88.95MB/88.95MB
b0de4b2589b5: Loading layer [==================================================>]  465.9MB/465.9MB
2ab7f09cbbf6: Loading layer [==================================================>]  2.048kB/2.048kB
e65ca9d50980: Loading layer [==================================================>]  3.584kB/3.584kB
f0d109c8738a: Loading layer [==================================================>]  3.584kB/3.584kB
0a3035fc9140: Loading layer [==================================================>]  3.072kB/3.072kB
17662e858f9f: Loading layer [==================================================>]  660.5kB/660.5kB
8a1c4b2eb9a4: Loading layer [==================================================>]  353.8kB/353.8kB
311a05749959: Loading layer [==================================================>]  3.584kB/3.584kB
Loaded image: sdkmanager:2.1.0.11698-Ubuntu_20.04


PS C:\MySpace\Tools\sdk_manager> docker tag sdkmanager:2.1.0.11698-Ubuntu_20.04 sdkmanager:latest
PS C:\MySpace\Tools\sdk_manager>
PS C:\MySpace\Tools\sdk_manager>
PS C:\MySpace\Tools\sdk_manager>
PS C:\MySpace\Tools\sdk_manager>
PS C:\MySpace\Tools\sdk_manager> docker run -it --rm sdkmanager --help

NVIDIA SDK MANAGER

  NVIDIA SDK Manager is an all-in-one tool that bundles developer software and
  provides an end-to-end development environment setup solution for NVIDIA
  SDKs.

General Options

  -h, --help                                      Displays this usage guide.
  --ver                                           Output the version of the installed SDK Manager client
  --settings                                      Configure SDK Manager settings in the terminal. It supports to
                                                  configure the parameters from SDK Manager settings UI, such as proxy
                                                  settings, concurrent downloads, privacy settings.
  --query interactive|non-interactive             Optional. Prints available options for the user.
                                                  interactive - gets the install command by inquiry session flow.
                                                  non-interactive - prints all options available for the user.
                                                  Using without value execute non-interactive.

                                                  Example:
                                                  --query interactive --login-type devzone
                                                  --query non-interactive --product Jetson
                                                  --query non-interactive --product DOCA --version 2.0.2
                                                  --query non-interactive --product Switch --action uninstall
  --show-all-versions                             Prints all available product versions for the user. If it is not set,
                                                  SDK Manager will only list the primary product versions.
  --export-logs folder_path                       Export the log files to folder_path when the install/uninstall
                                                  session is completed. Logs will be exported to the download folder if
                                                  folder_path is not set.
  --exit-on-finish                                Automatically exit from SDK Manager when the install/uninstall
                                                  session is completed.
  --user user_email                               Set the user email to log in. Valid only for NVONLINE users with
                                                  partners.nvidia.com accounts.
  --password string                               Set the user login password. Valid only for NVONLINE users with
                                                  partners.nvidia.com accounts.
  --login-type devzone|nvonline|offline           nvonline
  --stay-logged-in true|false                     Keep the user account logged in for the next running session. Default
                                                  is true. Please run --stay-logged-in false to disable this option.
  --logout                                        Log out the user account from SDK Manager.
  --download-folder string                        This option allows to set the folder path for the downloaded files.
                                                  Example:
                                                  --downloadfolder /my-mounted-drive/Shared/nvidia/sdk-manager
                                                  If --download-folder is not set, SDK Manager will use the default
                                                  folder: $/Downloads/nvidia/sdkm_downloads.
  --archived-versions                             Use this option to display only archived SDK versions which are not
                                                  shown on the standard run.
  --cli                                           Enable SDK Manager runs in CLI mode. If you want to run it in
                                                  unattended mode, you will need to provide more parameters which are
                                                  defined as optional. You can also use the --response-file option to
                                                  provide all required parameters to run unattendedly.
  --action install|uninstall|downloadonly         This allows SDK Manager to run install, uninstall, or download action
                                                  in the session. This option should be used together with other
                                                  options from "Additional Arguments".
  --sudo-password string                          Set the sudo password to skip the authentication prompt.Note that the
                                                  password is in clear text and visible in the terminal window.
  --collect-usage-data enable|disable             Enable or disable the collection of the usage data and send to SDK
                                                  Manager server.
  --check-for-updates true|false                  Check for the updates of SDK Manager client. Default is true. Please
                                                  run --check-for-updates false to disable this option.
                                                  To skip the update query, please run this option together with --auto
                                                  option.
  --list-connected all|Jetson|Holoscan|IGX|DOCA   List information for connected devices. Default is all. It also
                                                  supports to list only relavant devices for the specific product.
  --extra-config string                           Use extra configuration to overwrite the sofware and hardware data
                                                  for installation/uninstallation. This can be used to support the
                                                  installation of a third-party carrier board, customized packages, and
                                                  so on. For more details, please refer to the user guide.

Specific arguments for install/uninstall:

  --product product_name                  Set the product category to be installed in command-line mode.
  --version string                        Set the product version.  The value of --version could be a combination of
                                          product version, edition, target type and build number, separated by '_'.
                                          Use --cli or --query to get available version values.
                                          DRIVE example:
                                          --version 6.0.6
                                          Jetson example:
                                          --version 4.3
                                          Holoscan example:
                                          --version IGPU_1.2
                                          IGX example:
                                          --version 1.0
                                          DOCA example:
                                          --version 2.0.2
                                          Ethernet Switch example:
                                          --version 4.6.02
                                          Aerial example:
                                          --version 22-4
  --target-os string                      Set the target hardware operating system.
                                          Example:
                                          --target-os Linux
  --host                                  When this parameter is set, the host components will be selected.
  --target target_hardware                Use this parameter to select the specific target hardware.
                                          DRIVE example:
                                          --target DRIVE_AGX_ORIN_DEVKITS
                                          Jetson example:
                                          --target JETSON_AGX_ORIN_TARGETS
                                          Holoscan example:
                                          --target IGX_ORIN_DEVKIT_ES
                                          IGX example:
                                          --target IGX_ORIN_DEVKIT_IGPU_TARGETS
                                          DOCA example:
                                          --target BLUEFIELD3_DPU_BMC_100GBE
                                          Ethernet Switch example:
                                          --target SWITCH_5XXX_TARGETS
  --flash                                 Whether to flash the target. If the option is not set, SDK Manager will
                                          skipping the flashing.
  --usb-port string                       Select the usb port if multiple boards are connected. The usb_port_id can be
                                          retrieved from --list-connected command.
                                          Jetson example:
                                          --usb-port 1-2
  --serial-port string                    Select the serial port name if multiple USBs are connected.
                                          Aerial example:
                                          --serial-port /dev/ttyUSB1
  --additional-sdk additional_sdk_title   Specify additional SDKs to install. Multiple entries are allowed. Available
                                          additional_sdk_title can be retrieved from --cli command.
  --select section_or_group_title         Select the specified section or group to the installation list. Multiple
                                          entries are allowed. Available section_title and group_title can be retrieved
                                          from --cli command.
  --deselect section_or_group_title       Deselect the specified section or group from the installation list. Multiple
                                          entries are allowed. Available section_title and group_title can be retrieved
                                          from --cli command.
  --license accept|reject                 Set this option to accept the terms and conditions of the NVIDIA software
                                          licenses. If the option is not set, SDK Manager will prompt the license pages
                                          to you to review and confirm.
  --target-image-folder string            This option allows you to set the host location of the target hardware image
                                          for flashing.
                                          If this folder is not set, SDK Manager will use the default folder:
                                          $/nvidia/nvidia_sdk/
  --response-file string                  Use the response file from file_path to run SDK Manager in automated and
                                          unattended mode. Response file samples can be found in the folder
                                          /opt/nvidia/sdkmanager/.
  --export-response-file folder_path      Create the response file per user's selections and export the response file
                                          to folder_path before the session is successfully completed. If folder_path
                                          is not set, the response file will be created under the download folder. The
                                          host sudo password will not be saved to the response file. You can add it to
                                          the response file manually or use --sudo-password command line option to skip
                                          the sudo prompt.
  --auto                                  It auto completes all the prompts with default values. Used in CLI mode only.

Example

  $ sdkmanager [--cli]
  $ sdkmanager [--user user@user.com] [--query]
  $ sdkmanager [--check-for-updates]
  $ sdkmanager [--settings]
  $ sdkmanager [--help]

PS C:\MySpace\Tools\sdk_manager>
PS C:\MySpace\Tools\sdk_manager>
PS C:\MySpace\Tools\sdk_manager> docker run -it --rm sdkmanager --user ultrakillpc@gmail.com

Ignoring --user. This argument is supported only with --cli.
No DISPLAY environment variable detected.
Do you want to try the GUI mode anyhow? Yes
The futex facility returned an unexpected error code.

SDK Manager couldn't start in GUI mode.
Please review your display settings and run SDK Manager again. Alternatively, you can run SDK Manager in Command Line Interface (CLI) mode, which doesn't require a graphical display.
To do this, add '--cli' to your command when run SDK Manager (sdkmanager --cli).
Would you like to switch to CLI mode now? Yes

++++++++++++++++++++++++++++++++++++++++++++++++++
+   Welcome to NVIDIA SDK MANAGER v2.1.0.11698   +
++++++++++++++++++++++++++++++++++++++++++++++++++

┏ Login ---------------------------------------- ┓
- Select login type: NVIDIA Developer
         --TWO WAYS TO LOG IN--
Open https://static-login.nvidia.com/service/default/pin?user_code=46796296
                --OR--
Scan QR code:




SDK Manager will start once login is completed.
  1) Generate a new login user code (valid for 10 minutes)
❯ 2) Cancel login
PS C:\MySpace\Tools\sdk_manager> docker run -it --rm sdkmanager --user ultrakillpc@gmail.com

Ignoring --user. This argument is supported only with --cli.
No DISPLAY environment variable detected.
Do you want to try the GUI mode anyhow? No

PS C:\MySpace\Tools\sdk_manager> docker run -it --rm sdkmanager --password PPurple@123##

Ignoring --password. This argument is supported only with --cli.
No DISPLAY environment variable detected.
Do you want to try the GUI mode anyhow? No

PS C:\MySpace\Tools\sdk_manager> docker run -it --rm sdkmanager --cli --password PPurple@123##

++++++++++++++++++++++++++++++++++++++++++++++++++
+   Welcome to NVIDIA SDK MANAGER v2.1.0.11698   +
++++++++++++++++++++++++++++++++++++++++++++++++++

┏ Login ---------------------------------------- ┓
- Select login type: NVIDIA Developer
         --TWO WAYS TO LOG IN--
Open https://static-login.nvidia.com/service/default/pin?user_code=84893233
                --OR--
Scan QR code:


SDK Manager will start once login is completed.
❯ 1) Generate a new login user code (valid for 10 minutes)
  2) Cancel login
PS C:\MySpace\Tools\sdk_manager> docker run -it --rm sdkmanager --cli

++++++++++++++++++++++++++++++++++++++++++++++++++
+   Welcome to NVIDIA SDK MANAGER v2.1.0.11698   +
++++++++++++++++++++++++++++++++++++++++++++++++++

┏ Login ---------------------------------------- ┓
- Select login type: NVIDIA Developer
         --TWO WAYS TO LOG IN--
Open https://static-login.nvidia.com/service/default/pin?user_code=05132747
                --OR--
Scan QR code:


PS C:\MySpace\Tools\sdk_manager> docker run -it --rm sdkmanager --cli

++++++++++++++++++++++++++++++++++++++++++++++++++
+   Welcome to NVIDIA SDK MANAGER v2.1.0.11698   +
++++++++++++++++++++++++++++++++++++++++++++++++++                                                                                                                                                                                                                                                                                                                            ┏ 
Login ---------------------------------------- ┓
- Select login type: NVIDIA Developer
         --TWO WAYS TO LOG IN--
Open https://static-login.nvidia.com/service/default/pin?user_code=14831606
                --OR--
Scan QR code:


  ===== INSTALLATION COMPLETED SUCCESSFULLY. =====
      - CUDA on Host: Installed
      - CUDA Cross Compile Package on Host: Installed
      - NvSci: Installed
      - VPI on Host: Installed
      - Nsight Systems: Installed
      - Nsight Graphics: Installed
      - Nsight Compute: Installed
      - Nsight Perf SDK: Installed
      - Drivers for Jetson: Installed
      - File System and OS: Installed
      - Flash Jetson Linux: Skipped
      - DateTime Target Setup: Installed
      - CUDA Runtime: Installed
      - CuDNN Runtime: Installed
      - TensorRT Runtime: Installed
      - OpenCV Runtime: Installed
      - CuPVA Runtime: Installed
      - VPI Runtime: Installed
      - NVIDIA Container Runtime with Docker integration (Beta): Installed
      - Multimedia API: Installed
      - CUDA Toolkit for L4T: Installed
      - cuDNN on Target: Installed
      - TensorRT on Target: Installed
      - OpenCV: Installed
      - VPI on Target: Installed
      - Nsight Systems: Installed
      - Nsight Graphics: Installed
      - Nsight Compute: Installed                                                                                                                                                                                                                                                                                                                                               
  ===== Installation completed successfully - Total 28 components =====
  ===== 27 succeeded, 0 failed, 0 up-to-date, 1 skipped =====                                                                                                                                                                                                                                                                                                                 PS C:\MySpace\Tools\sdk_manager>                                                                                                                                                                                               
