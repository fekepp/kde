# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

KMNAME="kdebase-workspace"
KMMODULE="plasma"
inherit python kde4-meta

DESCRIPTION="Plasma: KDE desktop framework"
KEYWORDS=""
IUSE="debug +handbook google-gadgets python rss semantic-desktop xinerama"

COMMONDEPEND="
	$(add_kdebase_dep kdelibs 'semantic-desktop?')
	$(add_kdebase_dep kephal)
	$(add_kdebase_dep ksysguard)
	$(add_kdebase_dep libkworkspace)
	$(add_kdebase_dep libplasmaclock)
	$(add_kdebase_dep libplasmagenericshell)
	$(add_kdebase_dep libtaskmanager)
	$(add_kdebase_dep solid)
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXfixes
	x11-libs/libXrender
	google-gadgets? ( >=x11-misc/google-gadgets-0.11.0[qt4] )
	python? (
		>=dev-python/PyQt4-4.4.0[X]
		>=dev-python/sip-4.7.1
		$(add_kdebase_dep pykde4)
	)
	rss? ( $(add_kdebase_dep kdepimlibs) )
	xinerama? ( x11-libs/libXinerama )
"
DEPEND="${COMMONDEPEND}
	x11-proto/compositeproto
	x11-proto/damageproto
	x11-proto/fixesproto
	x11-proto/renderproto
	xinerama? ( x11-proto/xineramaproto )
"
RDEPEND="${COMMONDEPEND}"

KMEXTRACTONLY="
	krunner/dbus/org.freedesktop.ScreenSaver.xml
	krunner/dbus/org.kde.krunner.App.xml
	ksmserver/org.kde.KSMServerInterface.xml
	libs/kworkspace/
	libs/taskmanager/
	libs/plasmagenericshell/
	libs/ksysguard/
	ksysguard/
"

KMLOADLIBS="libkworkspace libplasmaclock libplasmagenericshell libtaskmanager"

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with google-gadgets Googlegadgets)
		$(cmake-utils_use_with python SIP)
		$(cmake-utils_use_with python PyQt4)
		$(cmake-utils_use_with python PyKDE4)
		$(cmake-utils_use_with rss KdepimLibs)
		$(cmake-utils_use_with semantic-desktop Nepomuk)
		-DWITH_Xmms=OFF
	)

	kde4-meta_src_configure
}

src_install() {
	kde4-meta_src_install

	rm -f \
		"${ED}$(python_get_sitedir)"/PyKDE4/*.py[co] \
		"${ED}${KDEDIR}"/share/apps/plasma_scriptengine_python/*.py[co]
}

pkg_postinst() {
	kde4-meta_pkg_postinst

	if use python; then
		python_mod_optimize \
			PyKDE4 \
			"${KDEDIR}"/share/apps/plasma_scriptengine_python
	fi
}

pkg_postrm() {
	kde4-meta_pkg_postrm

	if [[ -d ${EKDEDIR}/share/apps/plasma_scriptengine_python ]]; then
		python_mod_cleanup \
			PyKDE4 \
			"${KDEDIR}"/share/apps/plasma_scriptengine_python
	fi
}
