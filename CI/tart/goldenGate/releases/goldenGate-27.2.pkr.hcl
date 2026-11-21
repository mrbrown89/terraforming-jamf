packer {
  required_plugins {
    tart = {
      version = ">= 1.16.0"
      source  = "github.com/cirruslabs/tart"
    }
    ansible = {
      version = "~> 1"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "tart-cli" "tart" {
  from_ipsw    = "https://updates.cdn-apple.com/2026FallFCS/c9671975-52db-4fb5-9af2-00217169ba8d/UniversalMac_27.2_26B123_Restore.ipsw"
  vm_name      = "golden-gate-27.2"
  cpu_count    = 4
  memory_gb    = 8
  disk_size_gb = 50
  disk_format  = "asif"

  ssh_password = "admin"
  ssh_username = "admin"
  ssh_timeout  = "180s"

  # Tart 2.33.0+ supports automatic provisioning on macOS 27+
  run_extra_args = [
    "--no-audio",
    "--provisioning-opts=${join(",", [
      "fullName=Managed via Tart",
      "username=admin",
      "password=admin",
      "logsInAutomatically=true",
      "enablesRemoteLogin=true",
    ])}",
  ]

  boot_command = [
    # Wait for automatic provisioning and login
    "<wait120s>",

    # Open Terminal without relying on Spotlight
    "<wait10s><leftAltOn><leftShiftOn>g<leftShiftOff><leftAltOff><wait5s>/System/Applications/Utilities/Terminal.app<enter><wait5s><leftAltOn>o<leftAltOff>",

    # Enable keyboard navigation
    "<wait10s><wait10s>defaults write NSGlobalDomain AppleKeyboardUIMode -int 3<enter>",

    # Disable Gatekeeper (1/2)
    "<wait10s>sudo spctl --global-disable<enter>",
    "<wait10s>admin<enter>",

    # Disable Gatekeeper (2/2)
    "<wait10s>open -W '/System/Applications/System Settings.app' && open /System/Applications/Utilities/Terminal.app<enter>",

    # Wait for System Settings
    "<wait120s>",

    # Navigate to Privacy & Security
    "<wait10s><leftCtrlOn><f2><leftCtrlOff><right><right><right><down>Privacy & Security<enter>",
    "<wait10s><leftShiftOn><tab><tab><tab><tab><tab><tab><leftShiftOff>",
    "<wait10s><down><wait1s><down><wait1s><enter>",
    "<wait10s>admin<enter>",
    "<wait10s><leftShiftOn><tab><leftShiftOff><wait1s><spacebar>",

    # Quit System Settings
    "<wait10s><leftAltOn>q<leftAltOff>",

    # Open Sharing settings directly
    "<wait10s>open 'x-apple.systempreferences:com.apple.Sharing-Settings.extension'<enter>",

    # Enable Screen Sharing
    "<wait10s><tab><tab><tab><tab><tab><tab><spacebar>",
    "<wait10s>admin<enter>",

    # Quit System Settings
    "<wait10s><leftAltOn>q<leftAltOff>",
  ]

  create_grace_time  = "30s"
  recovery_partition = "keep"
}

build {
  sources = ["source.tart-cli.tart"]

  ###################################
  # Initial system configuration
  ###################################

  provisioner "shell" {
    inline = [
      # Enable passwordless sudo for admin
      "echo admin | sudo -S sh -c \"mkdir -p /etc/sudoers.d/; echo 'admin ALL=(ALL) NOPASSWD: ALL' | EDITOR=tee visudo /etc/sudoers.d/admin-nopasswd; chmod 0440 /etc/sudoers.d/admin-nopasswd\"",

      # Validate sudoers configuration
      "sudo visudo -c",

      # Set timezone
      "sudo systemsetup -settimezone GMT 2>/dev/null",
    ]
  }

  ###################################
  # Verify system configuration
  ###################################

  provisioner "shell" {
    inline = [
      # Ensure Gatekeeper is disabled
      "spctl --status | grep -q 'assessments disabled'",

      # Ensure Screen Sharing is enabled
      "sudo launchctl print system/com.apple.screensharing > /dev/null",

      # Ensure FileVault is disabled
      "sudo fdesetup status | grep -q 'FileVault is Off'",
    ]
  }

  ###################################
  # Xcode Command Line Tools and Homebrew
  ###################################

  provisioner "shell" {
    script = "../../../scripts/xcodeTools.sh"
  }

  provisioner "shell" {
    script = "../../../scripts/brew.sh"
  }

  ###################################
  # Ansible provisioners
  ###################################

  provisioner "ansible" {
    playbook_file   = "../../../ansible/autoLogin.yml"
    user            = "admin"
    extra_arguments = ["--extra-vars", "admin_user=admin kcpassword_b64=HO0/Sry8uizKyk6C ansible_become_pass=admin"]
  }

  provisioner "ansible" {
    playbook_file   = "../../../ansible/disableSleep.yml"
    user            = "admin"
    extra_arguments = ["--extra-vars", "ansible_become_pass=admin"]
  }

  provisioner "ansible" {
    playbook_file   = "../../../ansible/screenSaver.yml"
    user            = "admin"
    extra_arguments = ["--extra-vars", "ansible_become_pass=admin"]
  }

  provisioner "ansible" {
    playbook_file   = "../../../ansible/disableSpotlight.yml"
    user            = "admin"
    extra_arguments = ["--extra-vars", "ansible_become_pass=admin"]
  }

  provisioner "ansible" {
    playbook_file   = "../../../ansible/safariPrep.yml"
    user            = "admin"
    extra_arguments = ["--extra-vars", "ansible_become_pass=admin"]
  }

  provisioner "ansible" {
    playbook_file   = "../../../ansible/jamf.yml"
    user            = "admin"
    extra_arguments = ["--extra-vars", "ansible_become_pass=admin"]
  }

  provisioner "ansible" {
    playbook_file   = "../../../ansible/hostName.yml"
    user            = "admin"
    extra_arguments = ["--extra-vars", "ansible_become_pass=admin"]
  }
}
