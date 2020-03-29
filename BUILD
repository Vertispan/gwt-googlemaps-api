# Description:
#    Exported build rule for googlemaps api for gwt/j2cl
#

load("@com_google_jsinterop_generator//:jsinterop_generator.bzl", "jsinterop_generator")

package(
    default_visibility = ["//visibility:public"],
    # Apache2
    licenses = ["notice"],
)

exports_files(["LICENSE"])

jsinterop_generator(
    name = "googlemaps",
    exports = ["//java/com:googlemaps"],
)
