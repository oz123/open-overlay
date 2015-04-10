# Copyright open-overlay 2015 by Alex

EAPI="5"

DESCRIPTION="Meta package for GNOME 3, merge this package to install"
HOMEPAGE="http://www.gnome.org/"

LICENSE="metapackage"
SLOT="2.0" # Cannot be installed at the same time as gnome-2

# when unmasking for an arch
# double check none of the deps are still masked !
KEYWORDS="~amd64 ~arm ~ia64 ~ppc ~ppc64 ~x86"

IUSE="accessibility +bluetooth +classic +cdr cups +extras"

S=${WORKDIR}

# TODO: check accessibility completeness
# GDM-3.0 integrates very nicely with GNOME Shell
RDEPEND="
	>=gnome-base/gnome-core-libs-${PV}[cups?]
	>=gnome-base/gnome-core-apps-${PV}[cups?,bluetooth?,cdr?]

	>=gnome-base/gdm-${PV}

	>=x11-wm/mutter-3.14.3
	>=gnome-base/gnome-shell-3.14.3[bluetooth?]

	>=x11-themes/gnome-backgrounds-${PV}
	x11-themes/sound-theme-freedesktop

	accessibility? (
		>=app-accessibility/at-spi2-atk-2.14.1
		>=app-accessibility/at-spi2-core-2.14.0
		>=app-accessibility/caribou-0.4.15
		>=app-accessibility/orca-${PV}
		>=gnome-extra/mousetweaks-3.12.0 )
	classic? ( >=gnome-extra/gnome-shell-extensions-${PV} )
	extras? ( >=gnome-base/gnome-extra-apps-${PV} )
"

DEPEND=""

PDEPEND=">=gnome-base/gvfs-1.22.1[udisks]"
