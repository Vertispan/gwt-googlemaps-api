# This package contains the build rule to build google maps v3 api as if it were part of elemental2

load(
    "@com_google_jsinterop_generator//:jsinterop_generator.bzl",
    "jsinterop_generator"
)
load(
    "//build_defs/internal_do_not_use:elemental_utils.bzl",
    "patch_extern_file",
)

package(
    default_visibility = [
        "//:__subpackages__",
    ],
    # Apache2
    licenses = ["notice"],
)

patch_extern_file(
    name = "google_maps_api_patched",
    src = "//third_party:google_maps_api_v3.js",
    patch_file = "google_maps_api.js.patch"
)

#filegroup(
#    name = "externs",
#    srcs = ["//third_party:google_maps_v3_api.js"],
#)

jsinterop_generator(
    name = "googlemaps",
    srcs = [":google_maps_api_patched.js"],
    extension_type_prefix = "Maps",
    integer_entities_files = ["integer_entities.txt"],
    # override auto generated js_deps in order not to provide extern files
    # Common extern file are included by default.
    j2cl_js_deps = [],
    deps = [
        "//third_party:elemental2-core",
        "//third_party:elemental2-dom",
    ],
)
