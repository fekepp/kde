# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit cmake-utils subversion

DESCRIPTION="A library providing access to Open Collaboration Services"
HOMEPAGE="http://kde.org/"
ESVN_REPO_URI="svn://anonsvn.kde.org/home/kde/trunk/kdesupport/attica"
ESVN_PROJECT="libattica"

LICENSE="GPL-2 LGPL-2"
KEYWORDS=""
SLOT="0"
IUSE="debug"

DEPEND="
	x11-libs/qt-core:4
"
RDEPEND="${DEPEND}"

DOCS=(AUTHORS ChangeLog README)
