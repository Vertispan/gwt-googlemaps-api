package(default_visibility = [
    "//:__subpackages__",
])

licenses(["notice"])  # Apache2

load("//build_defs:version.bzl", "GOOGLE_MAPS_VERSION")
# Closure externs for google maps
alias(
    name = "google_maps_api_v3.js",
    actual = "@com_google_closure_compiler//:contrib/externs/maps/google_maps_api_v3_" + GOOGLE_MAPS_VERSION + ".js",
)

# Already-created elemental2 java apis, with metadata to let us reference them and share classes like Array, Element
alias(
    name = "elemental2-core",
    actual = "@com_google_elemental2//:elemental2-core",
)
alias(
    name = "elemental2-dom",
    actual = "@com_google_elemental2//:elemental2-dom",
)
alias(
    name = "elemental2-core-j2cl",
    actual = "@com_google_elemental2//:elemental2-core-j2cl",
)
alias(
    name = "elemental2-dom-j2cl",
    actual = "@com_google_elemental2//:elemental2-dom-j2cl",
)
alias(
    name = "elemental2-core__internal_src_generated",
    actual = "@com_google_elemental2//:elemental2-core__internal_src_generated",
)
alias(
    name = "elemental2-dom__internal_src_generated",
    actual = "@com_google_elemental2//:elemental2-dom__internal_src_generated",
)
