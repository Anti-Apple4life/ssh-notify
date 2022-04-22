# ssh-notify
This is a heavily modified version of [cmaster11's SSH notifier](https://gist.github.com/cmaster11/0a2c1b524502b98b3faf65b63b7e5e55#file-markdium-shell-bash), which he posted to [Medium.com](https://cmaster11.medium.com/how-to-get-notified-whenever-someone-logs-in-via-ssh-947a8f8d4f37). His script was made to work with Notify17, which, at least for me, was inoperative. This version works with PushOver, which is still active.
# Instructions
Clone the repository

[Create](https://pushover.net/signup) a PushOver account if you do not have one already

[Create](https://pushover.net/apps/build) a new application. Choose a name that you will remember, upload a logo (If you want to), agree to the Terms of Service and the Guide to being friendly to the API.

Your application is now created! Copy the API key and replace `YOUR_PUSHOVER_APP_TOKEN` in the script with your application key.

Go back to [your PushOver homepage](https://pushover.net/) and copy your user key. Replace `YOUR_PUSHOVER_USER_TOKEN` with your user key.

If you would like to whitelist your username from alerts, replace `YOUR_USERNAME` with your linux username. Otherwise, remove that entire if statement.

Edit the /etc/pam.d/sshd file and append the following line at the end:
```session [default=ignore] pam_exec.so /bin/bash /opt/ssh-notify.sh```
# Disclaimer
This has only been tested on Arch Linux, but it will most likely work on other linux distros. Test on Mac and Windows at your own risk.
