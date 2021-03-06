pkg_name=acl
pkg_origin=mozillareality
pkg_version=2.2.53
pkg_maintainer="Mozilla Mixed Reality <mixreality@mozilla.com>"
pkg_description="Commands for Manipulating POSIX Access Control Lists."
pkg_upstream_url="https://savannah.nongnu.org/projects/acl"
pkg_license=('lgpl')
pkg_source="http://download.savannah.gnu.org/releases/$pkg_name/$pkg_name-${pkg_version}.tar.gz"
pkg_shasum="06be9865c6f418d851ff4494e12406568353b891ffe1f596b34693c387af26c7"
pkg_deps=(
  core/glibc
  mozillareality/attr
)
pkg_build_deps=(
  core/coreutils
  core/diffutils
  core/patch
  core/make
  core/file
  core/gcc
  core/gettext
)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)

do_install() {
  make install
}

do_build() {
  CFLAGS="${CFLAGS} -O3 -g" ./configure --prefix "${pkg_prefix}"
  make
}

# ----------------------------------------------------------------------------
# **NOTICE:** What follows are implementation details required for building a
# first-pass, "stage1" toolchain and environment. It is only used when running
# in a "stage1" Studio and can be safely ignored by almost everyone. Having
# said that, it performs a vital bootstrapping process and cannot be removed or
# significantly altered. Thank you!
# ----------------------------------------------------------------------------
if [[ "$STUDIO_TYPE" = "stage1" ]]; then
  pkg_build_deps=(
    core/gcc
  )
fi
