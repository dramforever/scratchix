export KCONFIG_NOTIMESTAMP=1
make defconfig

function parseconfig {
    while read LINE; do
        NAME=
        OPTION=

        if ! [[ "" =~ ^CONFIG_ ]]; then continue; fi

        echo "parseconfig: removing "
        sed -i /'\(=\| \)'/d .config

        echo "parseconfig: setting ="
        echo "=" >> .config
    done
}


cat << EOF | parseconfig

CONFIG_PREFIX ""
CONFIG_INSTALL_NO_USR y

CONFIG_LFS y



# Use the external mount.cifs program.
CONFIG_FEATURE_MOUNT_CIFS n
CONFIG_FEATURE_MOUNT_HELPERS y

# Set paths for console fonts.
CONFIG_DEFAULT_SETFONT_DIR "/etc/kbd"

# Bump from 4KB, much faster I/O
CONFIG_FEATURE_COPYBUF_KB 64

# Set the path for the udhcpc script
CONFIG_UDHCPC_DEFAULT_SCRIPT "/default.script"


CONFIG_CROSS_COMPILER_PREFIX ""
CONFIG_FEATURE_UTMP n
CONFIG_FEATURE_WTMP n

EOF

make oldconfig

