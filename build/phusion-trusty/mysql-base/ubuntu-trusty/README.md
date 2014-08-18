Simple MySQL container based off of phusion-baseimage

UIDs
====================
When using volumes on the host system, the UIDs may not match up with the UIDs on the container and may create permission issues.

You may set `SYNC_UID=1` to instruct the container to look at the uid and gid of the /var/lib/mysql and update the mysql user and groups.

In production, the recommended solution is to use volume containers.
