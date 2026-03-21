# CI

## Tart

[Tart](https://tart.run) is a free open source hyper visor from cirrus labs. We will use tart as our hypervisor of choice.

## Packer

[Packer](https://developer.hashicorp.com/packer/docs). We will use packer to automate the building of macOS VMs. 

## Ansible

Packer will run a few Ansible playbooks to build our VM. One of the playbooks has the ability to put a Jamf invite on the desktop to easily enrol your mac vm for testing. You will need to set up an [invite](https://learn.jamf.com/en-US/bundle/jamf-pro-documentation-current/page/Providing_an_Enrollment_URL_to_Users.html) in Jamf. You can then put the invite ID and your Jamf URL into the `jamf.yml` playbook.

## macOS VM Versions

You'll notice there are different packer files for different OS versions. Each one will build the version of macOS the file is named. 

When a new version of macOS is released a new packer file should be made with the newer IPSW link.

## Putting it all Together

In the `/tart` directory you'll find directories named after the various macOS version. `cd` into these directories and you'll find a beta and releases directory. These directories contain packer files of various versions that you can test with. This packer file will build a macOS VM from scratch with the username and password of `admin`. Packer will download a fresh image mac image from Apple for this the first time you run the build. If you already run packer then tart will have it cached meaning builds will be quick.

If this is your first time running packer then you'll need to download the packer plugin for tart. `cd` to the packer file you want to build and run `packer init .`. Then once the download has completed run `packer build <packer file>.pkr.hcl`.

Once the VM has been built you can view it with `tart list`. Start the VM with `tart run <vm name>`. Once you've finished with the VM run `tart delete <vm name>`.

## Enrol into Jamf

In your VM you'll see a link on the desktop. Double click this link and safari will open with an enrol button to enrol the mac VM into the Jamf dev instance. Clicking on enrol will download the config profiles which you will need to install yourself.

## In Jamf

Your VM will have the name `testing-virt-<random number>`. In my work flow I have a virtual machine smart group which has the scope of machine name like `virt`. I then scope new config profiles or policies to this smart group so that I can safe test things.

## View Your VMs in Jamf

The script in `/CI/apiCalls/listVMs.sh` can be used to list all your VMs in Jamf. Make sure to edit the script to point to your Jamf tenant! 
