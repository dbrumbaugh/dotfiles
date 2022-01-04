# Verify that plan9port is installed before doing anything.
if [ -f /etc/profile.d/plan9.sh ]; then
    . /etc/profile.d/plan9.sh
fi
