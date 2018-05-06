# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit cmake-utils git-r3

DESCRIPTION=""
HOMEPAGE="https://www.pdal.io/index.html"
#SRC_URI="http://download.osgeo.org/pdal/PDAL-${PV}-src.tar.gz"
EGIT_REPO_URI="https://github.com/PDAL/PDAL.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bash-completion hexbin jsoncpp lasdump laszip pcl postgres python sqlite"

CMAKE_MIN_VERSION="2.8.11"
#S="${WORKDIR}/PDAL-${PV}-src"

DEPEND="sci-libs/gdal 
sci-libs/geos
jsoncpp? ( >=dev-libs/jsoncpp-1.6.2 )
laszip? ( sci-geosciences/laszip )
pcl? ( sci-libs/pcl )
postgres? ( dev-db/postgis )
sqlite? ( dev-db/sqlite )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_with bash-completion COMPLETION)
		#$(cmake-utils_use_build hexbin PLUGIN_HEXBIN)
		$(cmake-utils_use_build pcl PLUGIN_PCL)
		$(cmake-utils_use_build postgres PLUGIN_PGPOINTCLOUD)
		$(cmake-utils_use_build python PLUGIN_PYTHON)
		$(cmake-utils_use_with laszip LASZIP)
	)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	use lasdump && dobin ${BUILD_DIR}/bin/lasdump
}
