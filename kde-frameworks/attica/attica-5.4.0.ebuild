# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-frameworks/attica/attica-5.3.0.ebuild,v 1.1 2014/10/15 13:29:47 kensington Exp $

EAPI=5

inherit kde5

DESCRIPTION="Framework providing access to Open Collaboration Services"
LICENSE="LGPL-2.1+"
KEYWORDS=" ~amd64"
IUSE=""

RDEPEND="
	dev-qt/qtnetwork:5
"
DEPEND="${RDEPEND}"
