# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

KDEBASE="kdevelop"
KDE_TEST="true"
KMNAME="kdev-css"
inherit kde5

DESCRIPTION="CSS Language Support plugin for KDevelop"
LICENSE="GPL-2"
KEYWORDS=""
IUSE=""

RDEPEND="
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep ktexteditor)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep threadweaver)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	dev-util/kdevelop-pg-qt:5
	>=dev-util/kdevelop-5.1.80:5
"
DEPEND="${RDEPEND}
	sys-devel/flex
	test? ( >=dev-util/kdevelop-5.1.80:5[test] )
"

PATCHES=( "${FILESDIR}/${PN}-tests.patch" ) # TODO: upstream
