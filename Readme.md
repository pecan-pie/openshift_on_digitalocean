With this terraform scripts we try to make the install process of OpenShift 4.1 on DigitalOcean easy. Everything has been taken from the official documentation (https://docs.openshift.com/container-platform/4.1/installing/installing_bare_metal/installing-bare-metal.html).

**Note: This will never be a production ready cluster. This cluster is for testing only!**

# Preconditions
* openshift-install is in your PATH
* terraform > 1.12 is in your PATH
* you have a ssh public key in ~/.ssh/..
* you have a image pull secret from redhat

# Howto
1. cp install-config.yaml.sample install-config.yaml
2. vi install-config.yaml
3. mkdir config
4. cp install-config.yaml config
5. openshift-install create ignition-configs --dir config
6. terraform init
7. terraform apply --var do_token= .... --var domain= ....
8. delete the bootstrap and bootstrap-helper node

# Issues
* bootstap userdata is greater than 64kb
* loadbalancer configuration is wrong (update issues from terraform 1.11 -> 1.12)
