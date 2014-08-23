
SSH Key Generation Container
====================

Installs (appends) a SSH's public key in the specified location.

Options to customize the private key generation:

 * **`KEY_FILE`**: (required) location of the private key-- will generate if it does not exist
 * **`KEY_TYPE`**: The type of key to generate when generating the key
 * **`KEY_BITS`**: The number of bits to specifiy when generating the key
 * **`KEY_COMMENT`**: Comment to associate with the key when creating and in the authorized keys file
 * **`KEYGEN_OPTS`**: Specify additional options to ssh-keygen when generating the key

Variables available to adjust the public key installatoin
 * **`KEYS_FILE`**: (required) locaion to install (append) the public SSH key
 * **`KEY_COMMENT`**: Comment to associate with the key when creating and in the authorized keys file
 * **`KEY_OPTIONS`**: Options to put in the authorized_keys fie
