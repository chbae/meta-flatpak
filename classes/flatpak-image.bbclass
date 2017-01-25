IMAGE_FEATURES[validitems] += " \
    flatpak \
"

IMAGE_FEATURES += " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'flatpak', 'flatpak', '', d)} \
"

FEATURE_PACKAGES_flatpak = " \
    packagegroup-flatpak \
    ${@'flatpak-predefined-repos' \
         if d.getVar('FLATPAK_APP_REPOS') else ''} \
"

inherit ${@bb.utils.contains('DISTRO_FEATURES', 'flatpak', \
                             'flatpak-repo', '', d)}

