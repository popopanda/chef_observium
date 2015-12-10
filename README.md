# Observium

This cookbook will install packages and configure observium to run.

This has only been tested on RHEL/Centos 7, and will be updated to support Ubuntu.

  - Prefer to use encrypted databags for credentials
  - Fill out attributes

Things to fill out on the attributes file:
  - default['observium']['login']['username'] = ''
  - default['observium']['alert']['email'] = ''
  - default['observium']['mysql']['root']['password'] = ''
  - default['observium']['mysql']['observium']['password'] = ''
  - default['observium']['login']['password'] = ''

To use encrypted data bags:
 - Create a data bag locally on your workstation
 - Generate a private key running:
    - openssl rand -base64 512 | tr -d '\r\n' > ~/encrypted_data_bag_secret
 - Upload your data bag:
    - knife data bag from file databag databagitem.json --secret-file ~/encrypted_data_bag_secret
 - Transfer the private key to your node:
    - scp ~/encrypted_data_bag_secret root@xx.xx.xx.xx:/etc/chef
 - In your recipe, load the encrypted data bag

ex

    > encrypt_secret = Chef::EncryptedDataBagItem.load_secret('/etc/chef/encrypted_data_bag_secret')
    > root_password_data_bag = Chef::EncryptedDataBagItem.load('databag', 'databagitem', encrypt_secret)
    > observium_password_data_bag = Chef::EncryptedDataBagItem.load(databag, 'databagitem2', encrypt_secret)
