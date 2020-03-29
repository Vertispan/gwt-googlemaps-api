# gwt-googlemaps-api

Generated JsInterop types for J2CL projects to use when interacting with the Google Maps API v3. This project
uses the same mechanism as [elemental2](https://github.com/google/elemental2/) to generate its output: 
[jsinterop-generator](https://github.com/google/jsinterop-generator/). 

### GWT 2
Presently this is not compatible with GWT2, since it uses the `@JsEnum` annotation, but these may be changed
to use constants instead, or support could be added to GWT2 for this feature.


### Building
To build this project for maven, make sure you have the correct version of [Bazel](https://bazel.build) (see the 
`.bazelversion` file for the expected version), and invoke `build.sh`, then run your desired maven goal in the
`maven/` directory - probably `mvn clean install`.

## Including this in your project

### Bazel
As with elemental2, you can add this project as a `http_archive`, and depend on a target to use this in your
J2CL project. However, this project modifies how [closure-compiler](https://github.com/google/closure-compiler/)
is built (in a way that should remain compatible with elemental2), so please use this project's modified 
`load_elemental2_repo_deps` def instead of the one in elemental2. Roughly:

```
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "com_google_elemental2",
    strip_prefix = "elemental2-master",
    url = "https://github.com/google/elemental2/archive/master.zip",
)
http_archive(
    name = "com_vertispan_gwt_googlemaps",
    strip_prefix = "gwt-googlemaps-api-master",
    url = "https://github.com/Vertispan/gwt-googlemaps-api/archive/master.zip",
)

load("@com_vertispan_gwt_googlemaps//build_defs:repository.bzl", "load_elemental2_repo_deps")
load_elemental2_repo_deps()

load("@com_google_elemental2//build_defs:workspace.bzl", "setup_elemental2_workspace")
setup_elemental2_workspace()
```

Then, you can depend on target `@com_vertispan_gwt_googlemaps//:googlemaps`.

### Maven
The version string is based on the version of Google Maps that this is compatible with - 3.40 matches the current
version seen at https://developers.google.com/maps/documentation/javascript/reference as of writing, the `-1` suffix
exists to allow the generated Java to be updated and a new release made. The `-SNAPSHOT` suffix then indicates
that this is not yet ready for production as we incorporate feedback from users, tweak things in how the jsinterop
generator is used, etc.

Snapshots are presently available in either the Sonatype or Vertispan snapshot repository.
```xml
<dependency>
    <groupId>com.vertispan.gwt.jsinterop.wrapper</groupId>
    <artifactId>google-maps-api-v3</artifactId>
    <version>3.40-1-SNAPSHOT</version>
</dependency>
```