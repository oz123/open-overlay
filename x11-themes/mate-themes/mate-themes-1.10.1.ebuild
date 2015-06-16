# Copyright open-overlay 2015 by Alex

EAPI="5"

GCONF_DEBUG="no"

inherit gnome2 versionator

MATE_BRANCH="$(get_version_component_range 1-2)"
GTK_VERSION="gtk3.16"

SRC_URI="http://pub.mate-desktop.org/releases/${MATE_BRANCH}/${PN}-${GTK_VERSION}-${PV}.tar.xz"
DESCRIPTION="A set of MATE themes, with sets for users with limited or low vision"
HOMEPAGE="http://mate-desktop.org"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"

S=${WORKDIR}/${PN}-${GTK_VERSION}-${PV}
RDEPEND=">=x11-libs/gdk-pixbuf-2:2
	>=x11-libs/gtk+-2:2
	>=x11-themes/gtk-engines-2.15.3:2
	x11-themes/murrine-themes:0"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35:*
	sys-devel/gettext:*
	>=x11-misc/icon-naming-utils-0.8.7:0
	virtual/pkgconfig:*"

RESTRICT="binchecks strip"

src_configure() {
	gnome2_src_configure \
		--disable-test-themes \
		--enable-icon-mapping
}

DOCS="AUTHORS ChangeLog NEWS README"
