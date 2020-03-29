#!/usr/bin/env bash
# Inspired by elemental2's release_elemental2.sh script, this script unpacks
# the generated sources, appends a license header, and sets it up to be built,
# deployed by maven. The main advantage over the existing script is that it
# doesn't use j2cl's maven/deploy.sh, which hardcodes the repositoryId, url,
# use of GPG for deployment (sonatype snapshots doesn't require this), and
# also re-generates bytecode to match source code (just in case that were
# to matter). Additionally, this approach lets us ensure that maven plugins
# like net.ltgt.gwt.maven:gwt-maven-plugin to conform to expectations of
# downstream users.

# Fail on any error
set -e

# Let some env var define the specific bazel version to use, or look on the PATH if none is set
BAZEL=${BAZEL:-bazel}

# Get the parent dir of this script
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

BAZEL_ARTIFACT_PATH=${DIR}/bazel-bin/java/com/
MAVEN_JAVA_SRC=${DIR}/maven/src/main/java

LICENSE_HEADER=${DIR}/maven/license.txt

# Invoke Bazel to produce the sources that we need
${BAZEL} build //java/com:libgooglemaps-src.jar

# Copy generated java sources into maven source dir, apply license header
cd ${MAVEN_JAVA_SRC}
jar xf ${BAZEL_ARTIFACT_PATH}/libgooglemaps-src.jar
cd -

tmp_file=$(mktemp)
for java in $(find ${MAVEN_JAVA_SRC} -name '*.java'); do
    cat  ${LICENSE_HEADER} ${java} > ${tmp_file}
    mv ${tmp_file} ${java}
done


# Maven can now be invoked by hand, installing locally, deploying to its snapshot/staging repo