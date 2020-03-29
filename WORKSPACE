workspace(name = "com_vertispan_gwt_googlemaps")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Load J2CL, we don't get it from elemental2 or jsinterop-base
_J2CL_VERSION = "master"

http_archive(
    name = "com_google_j2cl",
    strip_prefix = "j2cl-%s" % _J2CL_VERSION,
    url = "https://github.com/google/j2cl/archive/%s.zip" % _J2CL_VERSION,
)

load("@com_google_j2cl//build_defs:repository.bzl", "load_j2cl_repo_deps")

load_j2cl_repo_deps()

load("@com_google_j2cl//build_defs:rules.bzl", "setup_j2cl_workspace")

setup_j2cl_workspace()

# Load elemental2 so we can share core and dom
http_archive(
    name = "com_google_elemental2",
    strip_prefix = "elemental2-master",
    url = "https://github.com/google/elemental2/archive/master.zip",
)

# We're _not_ sharing this rule from elemenetal2, we want to change the externs glob
load("//build_defs:repository.bzl", "load_elemental2_repo_deps")

load_elemental2_repo_deps()

load("@com_google_elemental2//build_defs:workspace.bzl", "setup_elemental2_workspace")

setup_elemental2_workspace()
