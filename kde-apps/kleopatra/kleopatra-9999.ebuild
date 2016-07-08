# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

KDE_HANDBOOK="optional"
KDE_TEST="forceoptional"
QT_MINIMAL="5.6.0"
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Certificate manager and GUI for OpenPGP and CMS cryptography"
HOMEPAGE="https://www.kde.org/applications/utilities/kleopatra"
LICENSE="GPL-2+ handbook? ( FDL-1.2+ )"
KEYWORDS=""

IUSE=""

# drop qtgui subslot operator when QT_MINIMAL >= 5.7.0
COMMON_DEPEND="
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	$(add_kdeapps_dep gpgmepp)
	$(add_kdeapps_dep kmime)
	$(add_kdeapps_dep libkleo)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui '' '' '5=')
	$(add_qt_dep qtnetwork)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtwidgets)
	>=app-crypt/gpgme-1.3.2
	dev-libs/boost:=
	dev-libs/libassuan
	dev-libs/libgpg-error
"
DEPEND="${COMMON_DEPEND}
	sys-devel/gettext
"
RDEPEND="${COMMON_DEPEND}
	!kde-apps/kdepim[kdepim_features_kleopatra]
	!<kde-apps/kdepim-15.12.2-r1
	>=app-crypt/gnupg-2.1
	app-crypt/paperkey
"
