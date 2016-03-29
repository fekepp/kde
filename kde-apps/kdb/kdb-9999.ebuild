# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit kde5 python-single-r1

DESCRIPTION="Database connectivity and creation framework for various vendors"
LICENSE="LGPL-2+"
KEYWORDS=""
IUSE="mysql postgres sqlite"

RDEPEND="
	$(add_frameworks_dep kcoreaddons)
	dev-libs/icu:=
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtxml)
	mysql? ( virtual/mysql )
	postgres? ( dev-db/postgresql:* )
	sqlite? ( dev-db/sqlite:3 )
"

DEPEND="${RDEPEND}
	${PYTHON_DEPS}
"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package mysql)
		$(cmake-utils_use_find_package postgres)
		$(cmake-utils_use_find_package sqlite)
	)

	kde5_src_configure
}
