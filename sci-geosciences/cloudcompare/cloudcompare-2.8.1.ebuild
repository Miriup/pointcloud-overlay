# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="3D point cloud and mesh processing software"
HOMEPAGE="http://www.cloudcompare.org"
#SRC_URI=""
EGIT_REPO_URI="https://github.com/CloudCompare/CloudCompare.git"
EGIT_COMMIT="v${PV}"
CMAKE_MIN_VERSION=3.0

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gdal"

DEPEND=">=dev-qt/qtcore-5.5
dev-qt/qtconcurrent
dev-qt/qtopengl
gdal? ( sci-libs/gdal )
"
RDEPEND="${DEPEND}"
