# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kdebase-data/kdebase-data-4.2.2.ebuild,v 1.1 2009/04/11 22:29:54 alexxy Exp $

EAPI="2"

KMNAME="kdebase-runtime"
KMNOMODULE="true"
inherit kde4-meta

DESCRIPTION="Icons, localization data and various .desktop files from kdebase."
IUSE=""
KEYWORDS=""

# Some files were moved from dolphin to kdebase-data between the 4.1.85 and the 4.1.87
# releases. Thus we need to block older versions of dolphin, including the :4.1 versions.
RDEPEND="
	!kdeprefix? ( !<kde-base/dolphin-4.1.87[-kdeprefix] )
	kdeprefix? ( !<kde-base/dolphin-4.1.87:${SLOT} )
	x11-themes/hicolor-icon-theme
"

KMEXTRA="
	l10n/
	pics/
"
# Note that the eclass doesn't do this for us, because of KMNOMODULE="true".
KMEXTRACTONLY="
	config-runtime.h.cmake
	kde4
"

src_configure() {
	# Remove remnants of hicolor-icon-theme
	sed -i \
		-e "s:add_subdirectory( hicolor ):#donotwant:g" \
		pics/CMakeLists.txt

	kde4-meta_src_configure
}
