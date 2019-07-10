= Howto
1. cp install-config.yaml.sample install-config.yaml
2. vi install-config.yaml
3. mkdir config
4. cp install-config.yaml config
5. openshift-install create ignition-configs --dir config
6. terraform init
7. terraform apply --var do_token= .... --var domain= ....

= Issues
* bootstap userdata is greater than 64kb
* loadbalancer configuration is wrong (update issues from terraform 1.11 -> 1.12)